if (!global.jogo_pausado) {
    global.jogo_pausado = true;
    instance_create_layer(0, 0, "GUI", o_menu_pausa);
}
