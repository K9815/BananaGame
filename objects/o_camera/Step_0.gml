// Referência da câmera
camera = view_camera[0];

// Dimensões da câmera
var view_w = camera_get_view_width(camera);
var view_h = camera_get_view_height(camera);

// Posição desejada da câmera (centraliza no jogador)
var alvo_x = o_player.x - view_w / 2;
var alvo_y = o_player.y - view_h / 1.2;

// Limites da sala
var max_x = room_width - view_w;
var max_y = room_height - view_h;

// Aplica limites (clamp) para não ultrapassar a room
alvo_x = clamp(alvo_x, 0, max_x);
alvo_y = clamp(alvo_y, 0, max_y);

// Atualiza a posição da câmera
camera_set_view_pos(camera, alvo_x, alvo_y);
