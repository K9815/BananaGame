var joy_w = sprite_width;
var joy_h = sprite_height;

// Canto inferior esquerdo com margem
var pos_x = 100;
var pos_y = 720 - joy_h - 50;

// Desenha a base
draw_sprite(spr_joysbase, 0, pos_x, pos_y);

// Atualiza a posição real do joystick
x = pos_x;
y = pos_y;

// Desenha o thumb (com offset baseado em joy_x, joy_y)
draw_sprite(spr_joystick, 0, x + joy_x, y + joy_y);
