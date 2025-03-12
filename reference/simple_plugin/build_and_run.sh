#!/bin/bash
set -e

# Navigate to the script directory
cd "$(dirname "$0")"

# Create build directory
mkdir -p build
cd build

# Configure and build with CMake
echo "Configuring with CMake..."
cmake ..

echo "Building..."
cmake --build .

# Run the host application
echo -e "\nRunning plugin_host application..."
cd bin
./plugin_host 