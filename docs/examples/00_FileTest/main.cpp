#include <fstream>
#include <iostream>
#include <string>
#include <emscripten/bind.h>

void hoge () {
  std::string line;
  std::ifstream fin ("input.txt");
  std::ofstream fout("output.txt");
  while (std::getline (fin, line)){
    // std::cout << line << std::endl;
    fout << "hofdafda: " << line << std::endl;
  }
}

EMSCRIPTEN_BINDINGS(wabc) {
    emscripten::function("hoge", &hoge);
}