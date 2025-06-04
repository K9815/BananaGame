global.musica_atual = -1;
global.musica_recurso = -1;
global.som_dano_tocando = false;
if (!variable_global_exists("musica_ativa")) global.musica_ativa = true;
if (!variable_global_exists("efeitos_ativos")) global.efeitos_ativos = true;


function tocar_musica(nova_musica) {
    if (!global.musica_ativa) {
        // Música desativada, para qualquer música que estiver tocando
        if (audio_is_playing(global.musica_atual)) {
            audio_stop_sound(global.musica_atual);
        }
        global.musica_atual = -1;
        global.musica_recurso = -1;
        return;
    }

    if (global.musica_recurso != nova_musica) {
        if (audio_is_playing(global.musica_atual)) {
            audio_stop_sound(global.musica_atual);
        }
        global.musica_atual = audio_play_sound(nova_musica, true, 1); 
        global.musica_recurso = nova_musica;
    }
}
