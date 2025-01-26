#!/bin/bash

# Infinite loop to run the command every 2 seconds
while true; do
  # Clear the terminal screen for better readability (optional)
  clear

  # Execute the kubectl command
  kubectl get po -n kube-core

  # Wait for 2 seconds before running the command again
  sleep 1
done