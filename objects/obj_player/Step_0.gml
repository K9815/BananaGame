// Define o sprite padrão como idle
sprite_index = spr_plidle;

// Velocidade do jogador
var speedmov = 3;

// Movimento para a esquerda
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    x -= speedmov;
    image_xscale = -2;
    sprite_index = spr_plwalk;
}

// Movimento para a direita
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    x += speedmov;
    image_xscale = 2;
    sprite_index = spr_plwalk;
}


if not keyboard_check(vk_right) and not keyboard_check(vk_left){
	sprite_index = spr_plidle;
}