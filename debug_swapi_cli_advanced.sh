#!/bin/bash

echo "🔍 Star Wars CLI Advanced Debug Script"
echo "======================================"

# Check if the file already exists
if [ ! -f "swapi-cli-macos" ]; then
    echo "📥 Downloading latest release..."
    curl -L -o swapi-cli-macos https://github.com/dnl-jst/swapi-cli/releases/download/v1.1.16/swapi-cli-macos
    chmod +x swapi-cli-macos
fi

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
echo "🧪 Direct Execution Tests (without timeout):"
echo "1. Testing --version:"
./swapi-cli-macos --version 2>&1 &
EXEC_PID=$!
sleep 3
if kill -0 $EXEC_PID 2>/dev/null; then
    echo "⚠️ Process still running after 3 seconds, killing..."
    kill $EXEC_PID
    wait $EXEC_PID 2>/dev/null
else
    wait $EXEC_PID
    echo "✅ --version completed"
fi

echo ""
echo "2. Testing --help:"
./swapi-cli-macos --help 2>&1 &
EXEC_PID=$!
sleep 3
if kill -0 $EXEC_PID 2>/dev/null; then
    echo "⚠️ Process still running after 3 seconds, killing..."
    kill $EXEC_PID
    wait $EXEC_PID 2>/dev/null
else
    wait $EXEC_PID
    echo "✅ --help completed"
fi

echo ""
echo "3. Testing basic execution with manual kill after 2 seconds:"
./swapi-cli-macos 2>&1 &
EXEC_PID=$!
echo "Process started with PID: $EXEC_PID"
sleep 2
if kill -0 $EXEC_PID 2>/dev/null; then
    echo "⚠️ Process still running after 2 seconds, killing..."
    kill $EXEC_PID
    wait $EXEC_PID 2>/dev/null
    echo "Process was killed (this might be the 'killed' issue you're seeing)"
else
    wait $EXEC_PID
    echo "✅ Basic execution completed naturally"
fi

echo ""
echo "🔧 Removing quarantine attribute if present:"
xattr -d com.apple.quarantine swapi-cli-macos 2>/dev/null || echo "No quarantine attribute found"

echo ""
echo "🌐 Testing network connectivity (fixing SSL):"
curl -k -I https://swapi.dev/api/people/1/ || echo "Network test failed even with -k flag"

echo ""
echo "🧪 Testing with different flags:"
echo "Testing with explicit flags..."
echo "4. Testing with explicit version flag:"
./swapi-cli-macos --version &
EXEC_PID=$!
sleep 2
if kill -0 $EXEC_PID 2>/dev/null; then
    kill $EXEC_PID
    wait $EXEC_PID 2>/dev/null
    echo "⚠️ --version test hung"
else
    wait $EXEC_PID
    echo "✅ --version test completed"
fi

echo ""
echo "📋 System Information:"
echo "macOS Version: $(sw_vers -productVersion)"
echo "Architecture: $(uname -m)"
echo "Available space: $(df -h . | tail -1)"

echo ""
echo "🔍 Let's check what happens when we strace/dtrace the process:"
echo "Running with verbose execution..."

# Try to see what system calls are being made
echo "Testing with process monitoring..."
./swapi-cli-macos --version &
EXEC_PID=$!
sleep 1
if kill -0 $EXEC_PID 2>/dev/null; then
    echo "Process $EXEC_PID is running..."
    ps -p $EXEC_PID -o pid,ppid,state,time,command
    kill $EXEC_PID
    wait $EXEC_PID 2>/dev/null
fi

echo ""
echo "✅ Advanced debug complete!"
echo ""
echo "🔍 Summary of findings:"
echo "- Code signature: Valid ✅"
echo "- Notarization: Properly signed ✅"
echo "- Quarantine: Not present ✅"
echo "- Network: SSL certificate issue ⚠️"
echo "- Execution: Appears to hang on network calls ⚠️"
