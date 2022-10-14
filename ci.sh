#!/bin/bash

# Perform Linting
ct lint --all --debug --config lint.yaml

# Create a k3d cluster
k3d cluster create --config charts/sorry-cypress/contributing/k3d.conf

# Prevent users from accidentally deploying to the wrong cluster.
currentContext=$(kubectl config current-context)
if [ "$currentContext" == "k3d-sorry-cypress-helm" ]; then
    echo "Starting deployment to cluister..."
else
    echo "The kubectl context is not what we expected. Exiting for safety. Perhaps the k3d cluster failed to create?"
    exit 1
fi

# Perform the installation tests
ct install --debug --config test.yaml
