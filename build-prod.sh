#!/bin/bash

# Production build script for BAS Website
# This script sets environment variables for Hugo production build

# Set production values
export HUGO_BASEURL="${HUGO_BASEURL:-https://bas.org.in/}"
export HUGO_ENV="production"

# Print configuration
echo "Building Hugo site for production with:"
echo "  Base URL: $HUGO_BASEURL"
echo "  Environment: $HUGO_ENV"
echo ""

# Clean previous builds
echo "Cleaning previous builds..."
rm -rf public/

# Build the site
echo "Building site..."
# Hugo automatically reads HUGO_* environment variables
hugo \
  --environment="$HUGO_ENV" \
  --minify

# Check if build was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build successful! Site generated in ./public/"
else
    echo ""
    echo "❌ Build failed!"
    exit 1
fi 