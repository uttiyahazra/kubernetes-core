#!/bin/bash

# Infinite loop to run the command every 2 seconds
while true; do
  # Clear the terminal screen for better readability (optional)
  clear

  # Execute the kubectl command
  kubectl get pods -n kube-core  -o custom-columns='POD NAME:.metadata.name,NAMESPACE:.metadata.namespace,IMAGES:.spec.containers[*].image,STATUS:.status.phase'

  # Wait for 1 second before running the command again
  sleep 1
done