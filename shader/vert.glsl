#version 440 core
layout (location = 0) in vec3 a_position;
layout (location = 0) in int indecies;
uniform mat4 mvp;
void main() {
   coord = a_position.xy;
   gl_Position = mvp*vec4(a_position, 1);
}
