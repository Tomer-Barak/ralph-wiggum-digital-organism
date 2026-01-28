# Dockerfile for ephemeral OpenCode agent containers
# Each email processing request spins up a fresh instance of this image

FROM python:3.11-slim

# Install system dependencies including sudo and gosu for user management
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    ca-certificates \
    gnupg \
    sudo \
    gosu \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 20.x (required for OpenCode)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install OpenCode CLI globally
RUN npm install -g opencode-ai@latest

# Create 'agent' user with UID 1000 (matches typical host user for volume permissions)
# This allows "tomer" on the host to read files created by "agent" in the container
RUN groupadd --gid 1000 agent && \
    useradd --uid 1000 --gid 1000 --create-home --shell /bin/bash agent

# Grant agent passwordless sudo access
RUN echo 'agent ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/agent && \
    chmod 0440 /etc/sudoers.d/agent

# Create agent home directory structure with proper ownership
RUN mkdir -p /home/agent/.config/opencode && \
    chown -R agent:agent /home/agent

# Create a staging directory for project files (these get copied at startup)
RUN mkdir -p /project-files

# Copy project files and config to staging directory
# (can't copy directly to /home/agent because volume mount overlays it at runtime)
COPY implementation_plan.md /project-files/
COPY prompt.md /project-files/
COPY spec.md /project-files/
COPY run_life.sh /project-files/
COPY config/opencode.json /project-files/opencode.json

# Set up environment variables
ENV HOME=/home/agent

WORKDIR /home/agent

# Create entrypoint script that:
# 1. Sets up home directory as root
# 2. Chowns all files to agent user
# 3. Drops privileges to agent user for the actual command
RUN cat > /entrypoint.sh << 'EOF'
#!/bin/bash
# Create necessary directories
mkdir -p /home/agent/.config/opencode

# Copy project files (only if not already present)
cp -n /project-files/opencode.json /home/agent/.config/opencode/ 2>/dev/null || true
cp -n /project-files/*.md /home/agent/ 2>/dev/null || true
cp -n /project-files/*.sh /home/agent/ 2>/dev/null || true
chmod +x /home/agent/run_life.sh 2>/dev/null || true

# Fix ownership of all files in /home/agent to be owned by agent
chown -R agent:agent /home/agent

# Drop privileges to agent user and execute the command
exec gosu agent "$@"
EOF
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
