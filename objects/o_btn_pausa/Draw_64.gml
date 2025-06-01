draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);

// Hitbox azul (com origem central corrigida)
var btn_w = sprite_get_width(sprite_index) * image_xscale;
var btn_h = sprite_get_height(sprite_index) * image_yscale;

var btn_left = x - btn_w / 2;
var btn_top = y - btn_h / 2;

draw_set_alpha(0.3);
draw_set_color(c_blue);
draw_rectangle(btn_left, btn_top, btn_left + btn_w, btn_top + btn_h, false);
draw_set_alpha(1);
draw_set_color(c_white);
