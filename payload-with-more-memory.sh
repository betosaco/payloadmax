#!/bin/bash

# Increase Node.js memory limit to 8GB
export NODE_OPTIONS="--max-old-space-size=8192 --no-deprecation"

# Run payload command with all arguments passed to this script
pnpm payload "$@" 