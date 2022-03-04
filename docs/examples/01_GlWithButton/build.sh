#!/bin/sh
option="-o index.js -std=c++17 -s USE_WEBGL2=1 -s USE_GLFW=3 -s WASM=1"
em++ -lembind main.cpp $option
