global.musica_atual = -1;
global.musica_recurso = -1;

function tocar_musica(nova_musica) {
    if (global.musica_recurso != nova_musica) {
        if (audio_is_playing(global.musica_atual)) {
            audio_stop_sound(global.musica_atual);
        }
        global.musica_atual = audio_play_sound(nova_musica, true, 1); 
        global.musica_recurso = nova_musica;
    }
}