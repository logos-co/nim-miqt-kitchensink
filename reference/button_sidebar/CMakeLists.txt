cmake_minimum_required(VERSION 3.16)
project(button_sidebar LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)  # Enable Qt's Meta-Object Compiler
set(CMAKE_AUTORCC ON)  # Enable automatic compilation of resource files

find_package(Qt6 COMPONENTS Widgets REQUIRED)

set(PROJECT_SOURCES
    main.cpp
    mainwindow.h
    mainwindow.cpp
    sidebarbutton.h
    sidebarbutton.cpp
    resources.qrc
)

qt_add_executable(button_sidebar
    ${PROJECT_SOURCES}
)

target_link_libraries(button_sidebar PRIVATE Qt6::Widgets) 