#include <fstream>
#include <iostream>
#include <string>
#include <emscripten/bind.h>

void hoge (const std::string& fname) {
  std::cout << "opening file in C++" << std::endl;
  std::cout << "   file_name: " << fname << std::endl;
  std::ifstream fin (fname);
  std::ofstream fout("output.txt");
  for(unsigned int iline=0;;++iline){
    std::string line;
    if( !std::getline (fin, line) ){ break; }
    fout << std::to_string(iline) << " : " << line << std::endl;
  }
}

EMSCRIPTEN_BINDINGS(wabc) {
    emscripten::function("hoge", &hoge);
}