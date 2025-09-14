switch (room) {
    case Menu:
    //case credits:
        tocar_musica(som_menu);
        break;
        
    case Room1:
    
		 tocar_musica(som_gameplay);
        break;

	case room_fim:
	
		tocar_musica(som_venceu);
		break;

    default:
        if (audio_is_playing(global.musica_atual)) {
            audio_stop_sound(global.musica_atual);
        }
        global.musica_recurso = -1;
        global.musica_atual = -1;
}
