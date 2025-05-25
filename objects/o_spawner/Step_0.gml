if (!global.jogo_pausado && wave_em_progresso) {
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
    wave_em_progresso = false; 

    // Mata os inimigos restantes (mantendo sua lógica)
    with (o_cenoura) { if (state != "morte") state = "morte"; }
    with (o_tomate) { if (state != "morte") state = "morte"; }

    // PAUSA o jogo E DISPARA O ALARME 0 para gerenciar a próxima fase (seleção de habilidade)
    global.jogo_pausado = true;
    
    // Este alarme agora será responsável por mostrar a tela de habilidades e depois reiniciar a wave
    alarm[0] = 1; // Dispara o alarme 0 no próximo frame.
                  // Se você quer um delay antes de mostrar a tela de habilidade.
                  // Ex: alarm[0] = 60; // 1 segundo de delay
}