#!/bin/bash

# Exit on error
set -e

# Create build directory if it doesn't exist
mkdir -p build
mkdir -p build/plugins

echo "Building plugin..."
export PKG_CONFIG_PATH=/opt/homebrew/Cellar/qt/6.8.2/libexec/lib/pkgconfig:$PKG_CONFIG_PATH && nim c -d:release --app:lib --out:build/plugins/libcalculator_plugin.dylib plugin/calculator_plugin.nim

echo "Building host application..."
export PKG_CONFIG_PATH=/opt/homebrew/Cellar/qt/6.8.2/libexec/lib/pkgconfig:$PKG_CONFIG_PATH && nim c -d:release --out:build/host_app host/main.nim

echo "Copying plugin to build directory..."
cp build/plugins/libcalculator_plugin.dylib build/

echo "Running host application..."
cd build
./host_app

echo "Done!" 