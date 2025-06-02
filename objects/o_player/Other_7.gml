if state == "attack one"{
	state = "move";
	image_index = 0;
}

if state == "dead" {
	  if (!global.jogo_pausado) {
            global.jogo_pausado = true;
			instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, "GUI", o_tela_morte);
			}
}