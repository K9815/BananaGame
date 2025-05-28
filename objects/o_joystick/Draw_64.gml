var joy_w = sprite_width;
var joy_h = sprite_height;

// Canto inferior esquerdo com margem
var pos_x = 50;
var pos_y = 720 - joy_h - 50;

draw_sprite(sprite_index, 0, pos_x, pos_y);

// Atualiza a posição real do joystick se ele detectar toques
x = pos_x;
y = pos_y;
