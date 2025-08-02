#!/bin/bash

echo "🔍 Star Wars CLI Debug Script"
echo "============================="

# Download der neuesten Version
echo "📥 Downloading latest release..."
curl -L -o swapi-cli-macos https://github.com/dnl-jst/swapi-cli/releases/download/v1.1.16/swapi-cli-macos
chmod +x swapi-cli-macos

echo ""
echo "🔍 File Information:"
file swapi-cli-macos
ls -la swapi-cli-macos

echo ""
echo "🔍 Extended Attributes (Quarantine Check):"
xattr -l swapi-cli-macos

echo ""
echo "🔍 Code Signature Check:"
codesign -dv swapi-cli-macos

echo ""
echo "🔍 Verification Check:"
codesign --verify --deep --strict --verbose=2 swapi-cli-macos

echo ""
echo "🔍 Spctl Assessment:"
spctl --assess --type exec --verbose swapi-cli-macos

echo ""
echo "🧪 Testing Execution:"
echo "1. Testing --version:"
timeout 10s ./swapi-cli-macos --version

echo ""
echo "2. Testing --help:"
timeout 10s ./swapi-cli-macos --help

echo ""
echo "3. Testing basic execution with timeout:"
timeout 5s ./swapi-cli-macos || echo "Basic execution timed out or failed"

echo ""
echo "🔧 Removing quarantine attribute if present:"
xattr -d com.apple.quarantine swapi-cli-macos 2>/dev/null || echo "No quarantine attribute found"

echo ""
echo "🧪 Testing after quarantine removal:"
timeout 10s ./swapi-cli-macos --version

echo ""
echo "🌐 Testing network connectivity:"
curl -I https://swapi.dev/api/people/1/ || echo "Network test failed"

echo ""
echo "✅ Debug complete!"
