shader_type canvas_item;
uniform vec3 col = vec3(1,1,1);

void fragment(){
	COLOR = texture(TEXTURE, UV);
	COLOR.b = col[0];
	COLOR.g = col[1];
	COLOR.r = col[2];
}