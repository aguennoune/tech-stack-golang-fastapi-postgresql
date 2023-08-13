#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Replace all Windows-style line endings (\r\n) with Unix-style line endings (\n) in all shell scripts (*.sh) 
found in the current directory and its subdirectories.

The script uses the pathlib module to find all shell scripts in the current directory and its subdirectories. 
It then reads the contents of each file as bytes, replaces all Windows-style line endings with Unix-style line endings, 
and writes the modified contents back to the file."""

from pathlib import Path


path: Path
for path in Path(".").glob("**/*.sh"):
    data = path.read_bytes()
    lf_data = data.replace(b"\r\n", b"\n")
    path.write_bytes(lf_data)