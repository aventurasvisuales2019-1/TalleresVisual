
varying vec4 vertColor;
varying vec3 cameraDirection;
varying vec3 lightDirectionReflected[8];
varying vec3 lightDirection[8]; 
varying vec3 ecNormal;

void main() {
	vec3 camera = normalize(cameraDirection);  	
	vec3 normal = normalize(ecNormal);
	gl_FragColor = vec4(0,0,0,1)*vertColor;
	for(int i =0;i<3;i++){
		/*
			Luz especular
		*/
		
		if(i!=1){

			vec3 direction_esp = normalize(lightDirectionReflected[i]);
			float specular_intensity = max(0.0, dot(direction_esp, camera));
			gl_FragColor = gl_FragColor+vec4(specular_intensity,specular_intensity,specular_intensity,1)*vertColor;
		}
		/*
			LUZ DIFUSA
		*/		
		else{

			vec3 direction_difus = normalize(lightDirectionReflected[i]);
			float difus_intensity = max(0.0, dot(direction_difus, normal));
			gl_FragColor = gl_FragColor+vec4(difus_intensity,difus_intensity,difus_intensity,1)*vertColor;
		}				
	}
		
}
