#include <fstream>
#include <iostream>
#include <string>

#include <emscripten/emscripten.h>
#include <emscripten/bind.h>
#define GLFW_INCLUDE_ES3
#define GL_SILENCE_DEPRECATION
#include <GLFW/glfw3.h>

void callback_resize(
    [[maybe_unused]] GLFWwindow *window,
    int width,
    int height) {
  printf("window_size_callback received width: %i, height: %i\n", width, height);
}

void callback_key(
    GLFWwindow *window,
    int key,
    [[maybe_unused]] int scancode,
    int action,
    [[maybe_unused]] int modifier) {
  if (key == GLFW_KEY_ESCAPE && action == GLFW_RELEASE)
    glfwSetWindowShouldClose(window, 1);

  if (key == GLFW_KEY_ENTER)
    std::cout << "Enter was hit\n" << std::endl;
}

void callback_mouse(
    [[maybe_unused]] GLFWwindow *window,
    [[maybe_unused]] int button,
    [[maybe_unused]] int action,
    [[maybe_unused]] int mods) {
  //assert(window != NULL); (void)button; (void)action; (void)mods;
  printf("Mouse buttion! \n");
}

struct MyData {
  bool is_click = false;
  GLFWwindow *window = nullptr;
};

void do_frame(MyData *data) {
  if( data->is_click ){
    glClearColor(0.8f, 1.0f, 1.0f, 1.0f);
  }
  else{
    glClearColor(1.0f, 1.0f, 0.8f, 1.0f);
  }
  glClear(GL_COLOR_BUFFER_BIT);
  glfwSwapBuffers(data->window);
  glfwPollEvents();
}

// ======================
// global data definition

MyData data;

// =================
// exposed functions

void hoge () {
  std::cout << "button clicked" << std::endl;
  data.is_click = !data.is_click;
}

int main() {
  if (glfwInit() != GL_TRUE) {
    printf("glfwInit() failed\n");
    glfwTerminate();
    return 0;
  }
  printf("glfwInit() success\n");
  data.window = glfwCreateWindow(
      512, 512,
      "GLFW test", nullptr, nullptr);

  if (!data.window) {
    printf("glfwCreateWindow() failed\n");
    glfwTerminate();
    return 0;
  }

  printf("glfwCreateWindow() success\n");
  glfwMakeContextCurrent(data.window);
  int windowWidth;
  int windowHeight;
  glfwGetFramebufferSize(data.window, &windowWidth, &windowHeight);
  glfwSetWindowSizeCallback(data.window, callback_resize);
  glfwSetMouseButtonCallback(data.window, callback_mouse);
  glfwSetKeyCallback(data.window, callback_key);  
  emscripten_set_main_loop_arg((em_arg_callback_func) do_frame, &data, 0, 1);

  glfwTerminate();
  return EXIT_SUCCESS;
}

EMSCRIPTEN_BINDINGS(wabc) {
    emscripten::function("hoge", &hoge);
}