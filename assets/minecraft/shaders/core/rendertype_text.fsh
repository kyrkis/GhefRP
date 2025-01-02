#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec4 lightColor;
in vec2 texCoord0;
in vec4 glpos;

flat in int effect;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
    if (color.a < 0.1) discard;

    switch (effect) {
        case 1: //blackbars
            color.rgb = vec3(0);
            color.a = abs(glpos.y) < 0.7? 0 : vertexColor.a;
        break;
    }

    fragColor = linear_fog(color * vertexColor * lightColor, vertexDistance, FogStart, FogEnd, FogColor);
}
