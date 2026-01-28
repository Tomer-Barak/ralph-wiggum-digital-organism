#!/bin/bash

# The loop acts as the heartbeat. 
# It continues ONLY if the agent successfully adds new tasks before the list runs out.
while grep -q "\- \[ \]" implementation_plan.md; do
    echo "Organism is active... processing next cycle."
    
    # Run the agent
    opencode run --model opencode/big-pickle "$(cat prompt.md)"
done

# If the loop breaks, it means the agent failed to plan for the future.
echo "CRITICAL FAILURE: Organism has starved (No tasks remaining)."
