shader_type canvas_item;

void fragment() {
    COLOR = texture(TEXTURE, UV + vec2(0.1,0.1) * TIME);
}