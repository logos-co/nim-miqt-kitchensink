# QHBoxLayout Example

This is a simple Qt application that demonstrates the use of QHBoxLayout.

## What is QHBoxLayout?

QHBoxLayout is a layout manager that arranges widgets horizontally from left to right. It's part of Qt's layout system which automatically arranges child widgets within a window.

## Features Demonstrated

- Creating a QHBoxLayout
- Adding widgets to the layout
- Setting stretch factors to control how space is distributed
- Setting spacing between widgets
- Setting margins around the layout

## Building the Application

To build this application, you need:

1. Qt 5 or later
2. CMake 3.5 or later

### Build Steps

```bash
mkdir build
cd build
cmake ..
make
```

## Running the Application

After building, run the executable:

```bash
./HBoxLayoutExample
```

## Screenshot

When running, the application will display a window with three buttons and a label arranged horizontally.

## Code Explanation

The main components of this example are:

- `mainwindow.h` and `mainwindow.cpp`: Define the main window class
- `main.cpp`: Application entry point
- `CMakeLists.txt`: Build configuration 