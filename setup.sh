#!/bin/bash

# Setup script for BAS Website
# This script helps with initial project setup

echo "🚀 BAS Website Setup Script"
echo "=========================="
echo ""

# Check for required tools
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "❌ $1 is not installed"
        return 1
    else
        echo "✅ $1 is installed: $($1 version 2>&1 | head -n 1)"
        return 0
    fi
}

echo "Checking prerequisites..."
echo ""

# Check Hugo
if ! hugo version &> /dev/null; then
    echo "❌ Hugo is not installed"
    echo "   Please install Hugo Extended: https://gohugo.io/installation/"
    exit 1
else
    if hugo version | grep -q "extended"; then
        echo "✅ Hugo Extended is installed: $(hugo version)"
    else
        echo "❌ Hugo Extended is required (you have regular Hugo)"
        echo "   Please install Hugo Extended: https://gohugo.io/installation/"
        exit 1
    fi
fi

# Check Go
check_command "go"
if [ $? -ne 0 ]; then
    echo "   Please install Go: https://golang.org/dl/"
    exit 1
fi

# Check Git
check_command "git"
if [ $? -ne 0 ]; then
    echo "   Please install Git: https://git-scm.com/"
    exit 1
fi

echo ""
echo "Installing Hugo modules..."
hugo mod get -u
hugo mod tidy

echo ""
echo "Setting up environment..."
if [ ! -f "env.config" ] && [ -f "env.config.example" ]; then
    cp env.config.example env.config
    echo "✅ Created env.config from template"
fi

echo ""
echo "Making scripts executable..."
chmod +x start-dev.sh build-prod.sh

echo ""
echo "Creating required directories..."
mkdir -p static/img content/posts

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Run './start-dev.sh' to start the development server"
echo "2. Visit http://localhost:1313 to view the site"
echo "3. Edit 'env.config' if you need custom settings"
echo ""
echo "Happy coding! 🎉" 