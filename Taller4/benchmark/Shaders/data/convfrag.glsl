#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
uniform vec2 texOffset; // Passing by processing. That's mean (1/width, 1/height)

uniform bool showMask; // Passing with Set function
uniform int maskSelected; // Passing with Set function

varying vec4 vertColor;
varying vec4 vertTexCoord;

const vec4 lumcoeff = vec4(0.299, 0.587, 0.114, 0);

void main() {
  
  vec2 tc0 = vertTexCoord.st + vec2(-texOffset.s, -texOffset.t);
  vec2 tc1 = vertTexCoord.st + vec2(         0.0, -texOffset.t);
  vec2 tc2 = vertTexCoord.st + vec2(+texOffset.s, -texOffset.t);
  vec2 tc3 = vertTexCoord.st + vec2(-texOffset.s,          0.0);
  vec2 tc4 = vertTexCoord.st + vec2(         0.0,          0.0);
  vec2 tc5 = vertTexCoord.st + vec2(+texOffset.s,          0.0);
  vec2 tc6 = vertTexCoord.st + vec2(-texOffset.s, +texOffset.t);
  vec2 tc7 = vertTexCoord.st + vec2(         0.0, +texOffset.t);
  vec2 tc8 = vertTexCoord.st + vec2(+texOffset.s, +texOffset.t);
  
  vec4 col0 = texture2D(texture, tc0);
  vec4 col1 = texture2D(texture, tc1);
  vec4 col2 = texture2D(texture, tc2);
  vec4 col3 = texture2D(texture, tc3);
  vec4 col4 = texture2D(texture, tc4);
  vec4 col5 = texture2D(texture, tc5);
  vec4 col6 = texture2D(texture, tc6);
  vec4 col7 = texture2D(texture, tc7);
  vec4 col8 = texture2D(texture, tc8);

  vec4 sum =  texture2D(texture, vertTexCoord.st)  ;
  /*
    EDGE DETECTION
    | -1 -1 -1 |
    | -1  8 -1 |
    | -1 -1 -1 |
  */
  if (showMask && maskSelected == 2) {
    sum = 8.0 * col4 - (col0 + col1 + col2 + col3 + col5 + col6 + col7 + col8);
  }
  
  /*
    Emboss
    | -2 -1 0 |
    | -1 1 1 |
    | 0 1 2 |
  */
  if (showMask && maskSelected == 1) {
    sum = (( col2 + col6) * 0) + ((col4 + col5 + col7) * 1) + ((col1+col3) *-1)+(col0*-2)+(col8*2);
  }
  /*
    Sharpen
    | 0 -1 0 |
    | -1 5 -1 |
    | 0 -1 0 |
  */
  if (showMask && maskSelected == 3) {
    sum = ((col0 + col2 + col6 + col8) * 0) + ((col1 + col3 + col5 + col7) * -1) + (col4 *5);
  }
  gl_FragColor = vec4(sum.rgb, 1.0);
}