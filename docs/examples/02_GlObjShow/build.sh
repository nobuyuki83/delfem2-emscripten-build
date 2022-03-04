#!/bin/sh
option="-o index.js -I../../../external/delfem2/include -std=c++17 -s USE_WEBGL2=1 -s USE_GLFW=3 -s WASM=1"
em++ -lembind main.cpp -o file.js $option
