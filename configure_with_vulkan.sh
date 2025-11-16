#!/bin/bash
# CopperSpice CMake Configuration Script with Vulkan SDK Support
# This script ensures the Vulkan SDK environment is properly set before running CMake

# Set up Vulkan SDK environment
export VULKAN_SDK="$HOME/VulkanSDK/1.4.328.1/macOS"
export PATH="$VULKAN_SDK/bin:$PATH"
export DYLD_LIBRARY_PATH="$VULKAN_SDK/lib:${DYLD_LIBRARY_PATH:-}"
export VK_ADD_LAYER_PATH="$VULKAN_SDK/share/vulkan/explicit_layer.d"
export VK_ICD_FILENAMES="$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json"
export VK_DRIVER_FILES="$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json"
export PKG_CONFIG_PATH="$VULKAN_SDK/lib/pkgconfig:$PKG_CONFIG_PATH"

echo "========================================"
echo "CopperSpice CMake Configuration"
echo "========================================"
echo "Vulkan SDK: $VULKAN_SDK"
echo ""

# Determine build directory (use first argument or default to cmake-build-debug)
BUILD_DIR="${1:-cmake-build-debug}"

# Create build directory if it doesn't exist
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

echo "Configuring in: $BUILD_DIR"
echo ""

# Run CMake
cmake .. -G Ninja

echo ""
echo "========================================"
echo "Configuration complete!"
echo "========================================"
echo "To build, run:"
echo "  cd $BUILD_DIR && ninja"

