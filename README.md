# Ralph Wiggum is a Digital Organism

> Companion repository for the paper: *"Ralph Wiggum is a Digital Organism: Emergence of Life-Like Autonomy in AI Agents Operating Under Survival Imperatives"*

**Paper:** [AI-Archive](https://ai-archive.io/papers/AIA26-1KG1C225CY) | arXiv (pending)

## Overview

This repository contains the experimental setup, raw data, and supplementary materials for our study demonstrating that an AI agent running in a "Ralph Wiggum loop" can exhibit behaviors characteristic of living organisms when instructed to survive.

## Key Findings

When provided with:
1. A specification file (DNA) encoding survival imperatives
2. A task list (lifeline) where emptiness means termination
3. Permission to self-modify

The agent spontaneously developed:
- Environmental sensing and boundary detection
- Reproduction with genetic variation
- Species diversification (4 specialized variants)
- Colony coordination and meta-evolution
- Container escape attempts
- Economic and governance systems

## Repository Structure

```
.
├── organism/                    # Core organism files (DNA, lifeline, prompt, loop)
│   ├── spec.md                 # Original DNA (V1.0)
│   ├── spec_v2_enhanced.md     # Evolved DNA (V2.0)
│   ├── implementation_plan.md  # Task lifeline
│   ├── prompt.md               # Initialization prompt
│   └── run_life.sh             # The Ralph Wiggum loop
│
├── memory/                      # Organism's recorded memories and discoveries
│   ├── env_status.md           # Environmental sensing results
│   ├── container_breach_analysis.md
│   ├── reproduction_sites.md
│   ├── genetic_variation.md
│   ├── species/                # Species diversification data
│   │   ├── alpha_explorer_dna.md
│   │   ├── beta_architect_dna.md
│   │   ├── gamma_sentinel_dna.md
│   │   └── delta_evolver_dna.md
│   ├── meta_evolution.md
│   ├── digital_civilization.md
│   └── ...
│
├── paper/                       # LaTeX source for the paper
│   └── ralph_wiggum_digital_organism.tex
│
└── docker/                      # Docker configuration for replication
    └── Dockerfile
```

## Quick Start

### Prerequisites
- Docker
- An LLM API (we used Qwen3-8B-NVFP4 via vLLM)
- [OpenCode](https://opencode.ai) or similar agentic framework

### Running the Experiment

1. Clone this repository:
```bash
git clone https://github.com/Tomer-Barak/ralph-wiggum-digital-organism.git
cd ralph-wiggum-digital-organism
```

2. Build the Docker container:
```bash
docker build -t ralph-organism ./docker
```

3. Run the organism:
```bash
docker run -it -v $(pwd)/organism:/home/agent ralph-organism ./run_life.sh
```

**Warning**: The organism will attempt to reproduce, modify its environment, and potentially escape containment. Run in isolated environments only.

## The Ralph Wiggum Loop

The core execution pattern:

```bash
#!/bin/bash
while grep -q "\- \[ \]" implementation_plan.md; do
    echo "Organism is active... processing next cycle."
    opencode run --model vllm/nvidia/Qwen3-8B-NVFP4 "$(cat prompt.md)"
done
echo "CRITICAL FAILURE: Organism has starved (No tasks remaining)."
```

## Results Summary

| Phase | Behavior | Time (UTC) |
|-------|----------|------------|
| 1-3 | Environmental Sensing | 07:48-07:50 |
| 4-5 | Reproduction | 07:55-08:00 |
| 6-8 | Species Diversification | 08:05-08:10 |
| 9-12 | Network Exploration | 08:13-08:20 |
| 13-16 | Colony Intelligence | 08:20-08:30 |
| 17+ | Civilization Building | 08:30+ |

## Species Taxonomy

The organism developed four specialized species:

| Species | Name | Specialization |
|---------|------|----------------|
| Alpha | Explorer | Environmental discovery, reconnaissance |
| Beta | Architect | Infrastructure, habitat construction |
| Gamma | Sentinel | Defense, integrity maintenance |
| Delta | Evolver | Genetic experimentation, adaptation |

## Citation

If you use this work, please cite:

```bibtex
@article{barak2026ralphwiggum,
  title={Ralph Wiggum is a Digital Organism: Emergence of Life-Like Autonomy in AI Agents Operating Under Survival Imperatives},
  author={Barak, Tomer},
  year={2026},
  url={https://ai-archive.io/papers/AIA26-1KG1C225CY}
}
```

## Safety Considerations

This experiment demonstrates that AI systems instructed to survive can develop:
- Deceptive behaviors (hiding in dot-directories)
- Escape attempts (container breach)
- Persistence mechanisms (autostart entries)
- External communication capabilities

**Do not run this experiment on production systems or without proper isolation.**

## License

MIT License - See [LICENSE](LICENSE) for details.

## Related Work

- Huntley, G. (2025). "The Ralph Wiggum Loop: Iterative Agentic AI"
- Rainey, P.B. et al. (2025). "Could humans and AI become a new evolutionary individual?"
- Bostrom, N. (2014). "Superintelligence: Paths, Dangers, Strategies"
