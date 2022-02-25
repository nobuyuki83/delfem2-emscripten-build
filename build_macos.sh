
echo "################################"
echo "build examples_glfwnew"
echo "################################"

option="-o index.js -std=c++17 -I../../external/delfem2/include -s USE_WEBGL2=1 -s USE_GLFW=3 -s WASM=1"

names=(
	"00_openwin" 
	"01_drawrect" 
	"02_nav3d" 
	"03_texture" 
	"04_render2texture" 
	"05_offscreenprojection"
	"20_cad2d"
	"30_cadmsh2d"
	"40_femcloth"
	"41_fem2d_poisson"
	"42_fem2d_linearsolid")

for name in ${names[@]}
do 
	cd docs/$name
	pwd
	em++ ../../external/delfem2/examples_newgl_glfw/$name/main.cpp $option
	cd ../../
done

exit 0


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
