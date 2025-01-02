#version 150

#moj_import <colorbits.glsl>
#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler0;
uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform int FogShape;

out float vertexDistance;
out vec4 vertexColor;
out vec4 lightColor;
out vec2 texCoord0;
out vec4 glpos;

flat out int effect;

vec2[] corners = vec2[] (vec2(-1, 1), vec2(-1, -1), vec2(1, -1), vec2(1, 1));

void main() {
    vertexDistance = fog_distance(Position, FogShape);
    vertexColor = Color;
    lightColor = texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    effect = 0;
    vec4 color = texture(Sampler0, texCoord0);
    //blackbars
    if (toint(color) == 0x010101FEu) {
        effect = 1;
        if (Color.r > 0.5) gl_Position.xy = corners[gl_VertexID % 4];
        else gl_Position = vec4(0);
    }
    glpos = gl_Position;
}
