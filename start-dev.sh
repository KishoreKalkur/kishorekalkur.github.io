#!/bin/bash

# Development server startup script for BAS Website
# This script sets environment variables for Hugo development

# Set default values if not already set
export HUGO_BASEURL="${HUGO_BASEURL:-http://localhost:1313/}"
export HUGO_PORT="${HUGO_PORT:-1313}"
export HUGO_BIND="${HUGO_BIND:-127.0.0.1}"

# Print configuration
echo "Starting Hugo development server with:"
echo "  Base URL: $HUGO_BASEURL"
echo "  Port: $HUGO_PORT"
echo "  Bind: $HUGO_BIND"
echo ""

# Start Hugo server
# Hugo automatically reads HUGO_* environment variables
hugo server \
  --port="$HUGO_PORT" \
  --bind="$HUGO_BIND" \
  --buildDrafts \
  --buildFuture \
  --buildExpired \
  --disableFastRender 