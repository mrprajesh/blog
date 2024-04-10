---
layout: post
title: Tinkering With HelloWorld Vulkan!
date: 11-04-2024 01:01:31 +05:30
tags: [vulkan]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

While I could have installed a vulkan SDK with just one `apt get install vulkan-sdk` 
command from the terminal, I somehow went for build from the [source](https://vulkan.lunarg.com/sdk/home).

```shell
# https://vulkan.lunarg.com/doc/view/latest/linux/getting_started_ubuntu.html#ubuntu-2204-jammy-jellyfish
wget -qO- https://packages.lunarg.com/lunarg-signing-key-pub.asc | sudo tee /etc/apt/trusted.gpg.d/lunarg.asc
sudo wget -qO /etc/apt/sources.list.d/lunarg-vulkan-jammy.list http://packages.lunarg.com/vulkan/lunarg-vulkan-jammy.list
sudo apt update
sudo apt install vulkan-sdk

## TO VERIFY
vkvia
vulkaninfo
vkcube

## had to do this 

sudo apt-get install libxrandr-dev python-is-python3 libwayland-dev  xorg-dev


# MINE WAS LINUX MINT SO KIND OF HACKED SCRIPT TO MAKE WORK FROM UBUNTU 22.04

sudo apt-get install libglm-dev cmake libxcb-dri3-0 libxcb-present0 libpciaccess0 \
             libpng-dev libxcb-keysyms1-dev libxcb-dri3-dev libx11-dev g++ gcc \
             libwayland-dev libxrandr-dev libxcb-randr0-dev libxcb-ewmh-dev \
             git python-is-python3 bison libx11-xcb-dev liblz4-dev libzstd-dev python3-distutils \
             ocaml-core ninja-build pkg-config libxml2-dev wayland-protocols python3-jsonschema
 
sudo apt-get install libglfw3-dev 
 
$ cat main.cpp 
#define GLFW_INCLUDE_VULKAN
#include <GLFW/glfw3.h>
#include <iostream>

int main() {
    glfwInit();
    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    GLFWwindow* window = glfwCreateWindow(800, 600, "Vulkan Hello World", nullptr, nullptr);

    uint32_t extensionCount = 0;
    vkEnumerateInstanceExtensionProperties(nullptr, &extensionCount, nullptr);

    std::cout << "Vulkan Extensions Count: " << extensionCount << std::endl;

    while (!glfwWindowShouldClose(window)) {
        glfwPollEvents();
    }

    glfwDestroyWindow(window);
    glfwTerminate();

    return 0;
}


$ cat CMakeLists.txt 
cmake_minimum_required(VERSION 3.10)
project(VulkanHelloWorld)

find_package(Vulkan REQUIRED)
find_package(glfw3 REQUIRED)

add_executable(VulkanHelloWorld main.cpp)
target_link_libraries(VulkanHelloWorld Vulkan::Vulkan glfw)
 
 
 mkdir build
 cmake ..
 
-- The C compiler identification is GNU 11.4.0
-- The CXX compiler identification is GNU 11.4.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Found Vulkan: /usr/lib/x86_64-linux-gnu/libvulkan.so (found version "1.3.280") found components: glslc glslangValidator 
-- Configuring done (0.2s)
-- Generating done (0.0s)
-- Build files have been written to: /home/rajesh/hellovulkan/build

 make
[ 50%] Building CXX object CMakeFiles/VulkanHelloWorld.dir/main.cpp.o
[100%] Linking CXX executable VulkanHelloWorld
[100%] Built target VulkanHelloWorld

./VulkanHelloWorld

```

