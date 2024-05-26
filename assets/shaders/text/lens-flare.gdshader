shader_type canvas_item;
render_mode blend_add;


uniform lowp sampler2D Screen_Sample : hint_screen_texture, filter_linear_mipmap_anisotropic;
uniform lowp sampler2D FlareMult;
uniform lowp sampler2D FlareMult2;

uniform float Blur = 2.5;
uniform float FlareThreshold;
uniform int Flares;
uniform float FlareSpacing;

uniform float Intensity;
uniform float Saturation_;

vec3 ApplyThreshold(vec3 CLR, float Threshold){
	return max(CLR - vec3(Threshold), vec3(0.0));
}

vec3 Saturation(vec3 InputCLR, float Saturation){
	return mix(vec3(dot(InputCLR.rgb, vec3(0.299, 0.587, 0.114))), InputCLR.rgb, Saturation);
}

void fragment(){
	vec2 FlippedUV = vec2(1.0) - SCREEN_UV;
	vec2 FlareVector = (vec2(0.5) - SCREEN_UV) * FlareSpacing;
	vec3 FinalFlare = vec3(0.0);
	
	for (int i = 0; i < Flares; ++i){
		vec2 SUV = fract(SCREEN_UV + FlareVector * vec2(float(i)));
		float Dist = distance(SUV, vec2(0.5));
		float Weight = 1.0 - smoothstep(0.0, 0.75, Dist);
		vec3 BlurredScreen = texture(Screen_Sample, SUV, Blur).rgb;
		BlurredScreen = ApplyThreshold(BlurredScreen, FlareThreshold);
		FinalFlare += BlurredScreen * Weight;
	}
	FinalFlare *= texture(FlareMult, SCREEN_UV).rgb;
	FinalFlare *= texture(FlareMult2, SCREEN_UV).rgb;
	COLOR.rgb = FinalFlare * Intensity;
	COLOR.rgb = Saturation(COLOR.rgb, Saturation_);
}