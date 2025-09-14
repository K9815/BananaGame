// o_game_controller - Evento Create
global.jogo_pausado = false;
global.joystick_hinput = 0; // Se você ainda usa essa global
global.ataque_pressionado = false; // <<< INICIALIZA A VARIÁVEL AQUI!
display_set_gui_size(1280, 720);

if (room == Menu && !instance_exists(o_menu)) {
    instance_create_layer(0, 0, "GUI", o_menu);
}
