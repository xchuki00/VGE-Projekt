#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdio>
#include <nanogui/screen.h>
#include <nanogui/window.h>
#include <nanogui/layout.h>
#include <nanogui/label.h>
#include <nanogui/checkbox.h>
#include <nanogui/button.h>
#include <nanogui/toolbutton.h>
#include <nanogui/popupbutton.h>
#include <nanogui/combobox.h>
#include <nanogui/progressbar.h>
#include <nanogui/entypo.h>
#include <nanogui/messagedialog.h>
#include <nanogui/textbox.h>
#include <nanogui/slider.h>
#include <nanogui/imagepanel.h>
#include <nanogui/imageview.h>
#include <nanogui/vscrollpanel.h>
#include <nanogui/colorwheel.h>
#include <nanogui/glcanvas.h>
#include <nanogui/graph.h>
#include <cmath>
#include <string>


#if defined(_WIN32)
#include <windows.h>
#endif

#include <nanogui/glutil.h>



using namespace std;
using namespace nanogui;
using nanogui::Screen;
using nanogui::Window;
using nanogui::GroupLayout;
using nanogui::Button;
using nanogui::Vector2f;
using nanogui::MatrixXu;
using nanogui::MatrixXf;
using nanogui::Label;

class MainApp {
public:
    float diameter = 6;
    float radius = 5000;
    Vector3f LS[3];
    Vector3f l = Vector3f(440, 1, 1);
    Vector3i enable = Vector3i(1, 0, 0);
    TextBox *textBoxs[5];
    Slider *sliders[5];
    nanogui::GLShader mShader;

    MainApp() {
        nanogui::init();

        /**
         * Create a screen, add a window.
         * To the window add a label and a slider widget.
         */

        Screen app{{650, 600}, "Newton's circle"};


        // Do the layout calculations based on what was added to the GUI
        app.performLayout();


        /**
         * Load GLSL shader code from embedded resources
         * See: https://github.com/cyrilcode/embed-resource
         */
        mShader.initFromFiles("base_shader","../shader/vert.glsl","../shader/frag.glsl");


        /**
         * Fill the screen with a rectangle (2 triangles)
         */
        app.drawAll();
        app.setVisible(true);

        /**
         * 10: clear screen
         * 20: set modulation value
         * 30: draw using shader
         * 40: draw GUI
         * 50: goto 10
         */
        while (!glfwWindowShouldClose(app.glfwWindow())) {
            glClearColor(0, 0, 0, 1);
            glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);

            mShader.bind();
            mShader.drawIndexed(GL_TRIANGLES, 0, 2);

            app.drawWidgets();

            glfwSwapBuffers(app.glfwWindow());
            glfwPollEvents();
        }

        nanogui::shutdown();
        exit(EXIT_SUCCESS);
    }



};

int main() {
    NewtonsRingsApp *app = new NewtonsRingsApp();
}
