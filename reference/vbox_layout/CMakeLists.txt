cmake_minimum_required(VERSION 3.16)

project(HBoxLayoutExample LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set architecture flags for Apple Silicon
if(APPLE)
    set(CMAKE_OSX_ARCHITECTURES "arm64" CACHE STRING "Build architectures for Mac OS X" FORCE)
endif()

# Find Qt package
find_package(Qt6 COMPONENTS Widgets REQUIRED)

add_executable(HBoxLayoutExample
    main.cpp
    mainwindow.cpp
    mainwindow.h
)

target_link_libraries(HBoxLayoutExample PRIVATE Qt6::Widgets) 