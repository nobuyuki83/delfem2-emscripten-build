
echo "################################"
echo "build examples_glfwnew"
echo "################################"

option="-o index.js -std=c++17 -I../external/delfem2/include -s USE_WEBGL2=1 -s USE_GLFW=3 -s WASM=1"

cd 00_openwin
pwd
em++ ../external/delfem2/examples_newgl_glfw/00_openwin/main.cpp $option
cd ../

cd 01_drawrect
pwd
em++ ../external/delfem2/examples_newgl_glfw/01_drawrect/main.cpp $option
cd ../

cd 02_nav3d
pwd
em++ ../external/delfem2/examples_newgl_glfw/02_nav3d/main.cpp $option
cd ../

cd 03_texture
pwd
em++ ../external/delfem2/examples_newgl_glfw/03_texture/main.cpp $option
cd ../

cd 04_render2texture
pwd
em++ ../external/delfem2/examples_newgl_glfw/04_render2texture/main.cpp $option
cd ../

cd 05_offscreenprojection
pwd
em++ ../external/delfem2/examples_newgl_glfw/05_OffScreenProjection/main.cpp $option
cd ../

cd 20_cad2d
pwd
em++ ../external/delfem2/examples_newgl_glfw/20_cad2d/main.cpp $option
cd ../

cd 30_cadmsh2d
pwd
em++  ../external/delfem2/examples_newgl_glfw/30_cadmsh2d/main.cpp $option
cd ../

cd 40_femcloth
pwd
em++ ../external/delfem2/examples_newgl_glfw/40_femcloth/main.cpp $option
cd ../

cd 41_fem2d_poisson
pwd
em++ ../external/delfem2/examples_newgl_glfw/41_fem2d_poisson/main.cpp $option
cd ../

cd 42_fem2d_linearsolid
pwd
em++ ../external/delfem2/examples_newgl_glfw/42_fem2d_linearsolid/main.cpp $option
cd ../


# =====================================

option_imgui=" ../external/imgui/imgui.cpp \
	../external/imgui/imgui_draw.cpp \
	../external/imgui/backends/imgui_impl_glfw.cpp \
	../external/imgui/backends/imgui_impl_opengl3.cpp \
	../external/imgui/imgui_tables.cpp \
	../external/imgui/imgui_widgets.cpp \
	-I../external/imgui -I../external/imgui/backends"

cd imgui_10_imgui_basic
pwd
em++ ../external/delfem2/examples_newgl_glfw_imgui/01_SimpleWithoutDelfem2/main.cpp \
	$option $option_imgui
cd ../
