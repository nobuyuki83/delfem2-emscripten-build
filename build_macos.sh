
echo "################################"
echo "build examples_glfwnew"
echo "################################"

option="-o index.js -std=c++17 -I../external/delfem2/include -s USE_WEBGL2=1 -s USE_GLFW=3 -s WASM=1"

echo "00_openwin"
cd 00_openwin
em++ ../external/delfem2/examples_newgl_glfw/00_openwin/main.cpp $option
cd ../

echo "01_drawrect"
cd 01_drawrect
em++ ../external/delfem2/examples_newgl_glfw/01_drawrect/main.cpp $option
cd ../

echo "02_nav3d"
cd 02_nav3d
em++ ../external/delfem2/examples_newgl_glfw/02_nav3d/main.cpp $option
cd ../

echo "03_texture"
cd 03_texture
em++ ../external/delfem2/examples_newgl_glfw/03_texture/main.cpp $option
cd ../

echo "04_render2texture"
cd 04_render2texture
em++ ../external/delfem2/examples_newgl_glfw/04_render2texture/main.cpp $option
cd ../

echo "05_offscreenprojection"
cd 05_offscreenprojection
em++ ../external/delfem2/examples_newgl_glfw/05_OffScreenProjection/main.cpp $option
cd ../

echo "20_cad2d"
cd 20_cad2d
em++ ../external/delfem2/examples_newgl_glfw/20_cad2d/main.cpp $option
cd ../

echo "30_cadmsh2d"
cd 30_cadmsh2d
em++  ../external/delfem2/examples_newgl_glfw/30_cadmsh2d/main.cpp $option
cd ../

echo "40_femcloth"
cd 40_femcloth
em++ ../external/delfem2/examples_newgl_glfw/40_femcloth/main.cpp $option
cd ../

echo "41_fem2d_poisson"
cd 41_fem2d_poisson
em++ ../external/delfem2/examples_newgl_glfw/41_fem2d_poisson/main.cpp $option
cd ../

echo "42_fem2d_linearsolid"
cd 42_fem2d_linearsolid
em++ ../external/delfem2/examples_newgl_glfw/42_fem2d_linearsolid/main.cpp $option
cd ../


# =====================================

pwd

echo "imgui_10_imgui_basic"
cd imgui_10_imgui_basic

pwd

em++ ../external/delfem2/examples_newgl_glfw_imgui/01_SimpleWithoutDelfem2/main.cpp \
	$option \
	../external/imgui/imgui.cpp \
	../external/imgui/imgui_draw.cpp \
	../external/imgui/backends/imgui_impl_glfw.cpp \
	../external/imgui/backends/imgui_impl_opengl3.cpp \
	../external/imgui/imgui_tables.cpp \
	../external/imgui/imgui_widgets.cpp \
	-I"../external/imgui" -I"../external/imgui/backends"
cd ../
