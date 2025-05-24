// o_spawner - Step Event

// Só gera inimigos se o jogo NÃO estiver pausado E uma wave estiver em progresso
if (!global.jogo_pausado && wave_em_progresso) { // Adicionado wave_em_progresso aqui
    contador_spawn += 1;

    if (contador_spawn >= tempo_spawn) {
        contador_spawn = 0;
        var tipo = choose(o_cenoura, o_tomate);
        var spawn_x = irandom_range(30, room_width - 30);
        var spawn_y = o_player.y;
        instance_create_layer(spawn_x, spawn_y, "Instances", tipo);
    }
}

// Lógica de Fim de Wave
if (inimigos_derrotados >= inimigos_por_wave && wave_em_progresso) {
    wave_em_progresso = false; // Sinaliza que a wave atual terminou

    // Mata os inimigos restantes
    with (o_cenoura) { if (state != "morte") state = "morte"; }
    with (o_tomate) { if (state != "morte") state = "morte"; }

    // --- Lógica para mostrar a tela de habilidades
    // Incrementa a wave AQUI, pois a tela é para a próxima wave
    wave_atual += 1;

    // Só mostra a seleção de habilidades da 2ª wave em diante (se wave_atual for 2 ou mais)
    // Se você quer que a tela apareça após a 1ª wave, mude para 'if (wave_atual >= 1)'
    if (wave_atual >= 1) { // Mudado para >= 1 para aparecer após a primeira wave
        global.jogo_pausado = true; // PAUSA o jogo COMPLETO

        var temp_habilidades_para_sortear = global.todas_habilidades;
        var escolhas = [];

        while (array_length(escolhas) < 3 && array_length(temp_habilidades_para_sortear) > 0) {
            var index = irandom(array_length(temp_habilidades_para_sortear) - 1);
            array_push(escolhas, temp_habilidades_para_sortear[index]);
            array_delete(temp_habilidades_para_sortear, index, 1);
        }

        var tela = instance_create_depth(0, 0, -100, o_selecaohab);
        tela.habilidades_exibidas = escolhas;
    }
}