// Define o sprite padrão como idle
sprite_index = spr_plidle;

// Velocidade do jogador
var speedmov = 3;

// Movimento para a esquerda
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) and not place_meeting(x-speedmov, y, o_parede){
    x -= speedmov;
    image_xscale = -2;
    sprite_index = spr_plwalk;
}

// Movimento para a direita
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) and not place_meeting(x+speedmov, y, o_parede){
    x += speedmov;
    image_xscale = 2;
    sprite_index = spr_plwalk;
}