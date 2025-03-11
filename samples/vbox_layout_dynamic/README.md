# QVBoxLayout Example

This example demonstrates how to use QVBoxLayout to arrange widgets vertically in a Qt application using Nim.

## Overview

QVBoxLayout is a layout manager that arranges widgets vertically from top to bottom. This example shows:

- Creating a QVBoxLayout
- Adding widgets to the layout
- Setting stretch factors for widgets
- Setting spacing and margins

## Implementation Details

The example consists of:

- A main window with a central widget
- A QVBoxLayout that arranges:
  - Three buttons
  - A label
- Stretch factors that make the label take up more space than the buttons
- Spacing between widgets and margins around the layout

## Running the Example

To run the example:

```bash
cd samples/vbox_layout
nim c -r main.nim
```

## Code Structure

- `main.nim`: Entry point that creates the application and main window
- `mainwindow.nim`: Implements the main window with the QVBoxLayout

## Screenshot

When running the example, you should see a window with three buttons and a label arranged vertically. 