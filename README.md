# Computer Architecture: Assembly with MASM
 A repo for weekly Assembly language coding projects using MASM on x86 architecture. Projects are implemented both in traditional assembly style and with the Irvine32 library.

## Overview
This repo stores my assembly language projects and assignments primarily targeting x86 processors using MASM assembler. Early weeks focus on classical assembly programming, while from week 5 onwards the focus shifts towards using the Irvine32 library. 

## Setup
To work with this repository, ensure you have:
- An x86 processor-based system.
- Visual Studio configured with MASM support.
- Debug mode enabled for easier testing.

## Visual Studio Configuration
- Add .masm files extension in Build Customization > Build Dependencies for proper compilation.
- To run individual .asm files, go to its Properties and set Exclude from Build to No to include that file in the build process.
- For assemblies leveraging the Irvine32 library, follow the setup instructions in this tutorial by Makotto: https://youtu.be/bHmQJLXZf00?feature=shared

## Troubleshooting
Occasionally, building .asm files that use the Irvine32 library might fail due to antivirus conflicts. To fix this, try temporarily disabling real-time scanning on your antivirus:<br>
Windows Security > Open McAfee > Real-Time Scanning > Turn off for 60 mins

## Usage
- Open the solution in Visual Studio.
- Select the .asm file you want to build and run.
- Ensure the file is included in the build as described above.
- Build and debug as usual.

