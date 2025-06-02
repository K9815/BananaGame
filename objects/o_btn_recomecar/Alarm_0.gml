global.jogo_pausado = false;
if (room != Room1) {
	show_debug_message("mec");
    room_goto(Room1);
} else {
    room_restart(); // reinicia Room1 se já estiver nela
	show_debug_message("a");
}