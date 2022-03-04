#include <fstream>
#include <iostream>
#include <string>
#include <cmath>
#include <emscripten/bind.h>
#include <emscripten/emscripten.h>
#define GLFW_INCLUDE_ES3
#if defined(_MSC_VER)
  #include <windows.h>
#endif
#include <GLFW/glfw3.h>

#include "delfem2/msh_io_obj.h"
#include "delfem2/msh_primitive.h"
#include "delfem2/msh_affine_transformation.h"
#include "delfem2/glfw/viewer3.h"
#include "delfem2/glfw/util.h"
#include "delfem2/opengl/new/drawer_mshtri.h"

namespace dfm2 = delfem2;

// ---------------------------

struct MyData {
  std::vector<float> aXYZ;
  std::vector<unsigned int> aTri;
  dfm2::opengl::CShader_TriMesh shdr;
  delfem2::glfw::CViewer3 viewer;
};

// ---------------------------

void draw(MyData* data)
{
  ::glClearColor(0.8, 1.0, 1.0, 1.0);
  ::glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
  ::glEnable(GL_DEPTH_TEST);
  ::glDepthFunc(GL_LESS);
  ::glEnable(GL_POLYGON_OFFSET_FILL );
  ::glPolygonOffset( 1.1f, 4.0f );
  data->shdr.Draw(
      data->viewer.GetProjectionMatrix().data(),
      data->viewer.GetModelViewMatrix().data());
  data->viewer.SwapBuffers();
  glfwPollEvents();
}

// ======================

MyData data;

void hoge (const std::string& fname) {
  std::cout << "opening file in C++" << std::endl;
  std::cout << "   file_name: " << fname << std::endl;
  delfem2::Read_Obj3(
    data.aXYZ, data.aTri,
    fname);
  delfem2::Normalize_Points3(data.aXYZ);
  std::cout << "   " << data.aXYZ.size()/3 << " " << data.aTri.size() /3 << std::endl;    
  data.shdr.Initialize(data.aXYZ, 3, data.aTri);
}

EMSCRIPTEN_BINDINGS(wabc) {
    emscripten::function("hoge", &hoge);
}

int main()
{
  delfem2::MeshTri3_Torus(
    data.aXYZ, data.aTri,
    1.f, 0.2f, 32, 18);
  data.viewer.projection = std::make_unique<delfem2::Projection_LookOriginFromZplus>(2, false);
  // ------
  dfm2::glfw::InitGLNew();
  data.viewer.OpenWindow();  
  data.shdr.InitGL();
  data.shdr.Initialize(data.aXYZ, 3, data.aTri);
  
  emscripten_set_main_loop_arg((em_arg_callback_func) draw, &data, 0, 1);
  
  glfwDestroyWindow(data.viewer.window);
  glfwTerminate();
  exit(EXIT_SUCCESS);
}


