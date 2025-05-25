// Primeira fase: Fim da Wave / Mostrar Tela de Habilidades
if (global.jogo_pausado == true && !instance_exists(o_selecaohab)) {
    show_debug_message("Spawner Alarm 0 (Fase 1): Fim de wave detectado. Mostrando tela de habilidades.");
    
    wave_atual += 1; 

    var num_habilidades_para_exibir = 3;
    var temp_habilidades_para_sortear_copy = array_create(0);
    array_copy(temp_habilidades_para_sortear_copy, 0, global.todas_habilidades, 0, array_length(global.todas_habilidades));
    var escolhas = [];

    while (array_length(escolhas) < num_habilidades_para_exibir && array_length(temp_habilidades_para_sortear_copy) > 0) {
        var index = irandom(array_length(temp_habilidades_para_sortear_copy) - 1);
        array_push(escolhas, temp_habilidades_para_sortear_copy[index]);
        array_delete(temp_habilidades_para_sortear_copy, index, 1);
    }

    var tela = instance_create_depth(0, 0, -100, o_selecaohab); 
    tela.habilidades_exibidas = escolhas;
} 
// Segunda fase: Iniciar Próxima Wave
else if (global.jogo_pausado == false && !wave_em_progresso && !instance_exists(o_selecaohab)) {
    show_debug_message("Spawner Alarm 0 (Fase 2): Habilidade selecionada. Iniciando Wave " + string(wave_atual) + ".");

    // Garante que o jogo está despausado ANTES de iniciar a próxima wave
    global.jogo_pausado = false; // <<< ADICIONE ESTA LINHA NOVAMENTE AQUI

    inimigos_por_wave = 5 + (wave_atual * 2); 
    inimigos_derrotados = 0; 
    
    wave_em_progresso = true; 
    contador_spawn = 0; 
}