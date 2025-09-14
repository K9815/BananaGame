var btn_w = sprite_width;
var btn_h = sprite_height;

// Posição: canto inferior direito com margem
var pos_x = 1280 - btn_w - 50;
var pos_y = 720 - btn_h - 50;

draw_sprite(sprite_index, 0, pos_x, pos_y);

// Atualiza a posição real do botão se precisar detectar toque
x = pos_x;
y = pos_y;
