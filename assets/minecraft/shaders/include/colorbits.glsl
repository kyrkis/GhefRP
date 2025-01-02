#define rgbv(r,g,b) vec3(r,g,b)/255.
#define rgbav(r,g,b,a) vec4(r,g,b,a)/255.
#define hex3(i) vec3((i&0xFF0000)>>16, (i&0xFF00)>>8, (i&0xFF))/255.
#define hex4(i) vec4((i&0xFF0000u)>>24, (i&0xFF0000u)>>16, (i&0xFF00u)>>8, (i&0xFFu))/255.

ivec3 torgb(vec3 v) {return ivec3(round(v*255));}
uvec4 torgba(vec4 v) {return uvec4(round(v*255));}
int toint(ivec3 v) {return (v.r << 16) + (v.g << 8) + v.b;}
uint toint(uvec3 v) {return (v.r << 16) + (v.g << 8) + v.b;}
uint toint(uvec4 v) {return (v.r << 24) + (v.g << 16) + (v.b << 8) + v.a;}
int toint(vec3 v) {return toint(torgb(v));}
uint toint(vec4 v) {return toint(torgba(v));}