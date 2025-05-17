contador_spawn += 1;

if (contador_spawn >= tempo_spawn) {
    contador_spawn = 0;

    var tipo = choose(o_cenoura, o_tomate);

    // Gera uma posição aleatória dentro da faixa permitida
    var spawn_x = irandom_range(30, 1250);
    var spawn_y = o_player.y;

    instance_create_layer(spawn_x, spawn_y, "Instances", tipo);
}

if (inimigos_derrotados >= inimigos_por_wave && wave_em_progresso) {
    wave_em_progresso = false;
    
    // Espera alguns segundos antes de iniciar a próxima wave (opcional)
    alarm[0] = 120; // 2 segundos, por exemplo
}
