// o_spawner - Alarm 0 Event
// Este alarme é disparado APÓS a seleção de habilidades
inimigos_por_wave += 5; // Aumenta a quantidade de inimigos para a nova wave
inimigos_derrotados = 0;
wave_em_progresso = true; // Começa a próxima wave, permitindo o spawn e movimento

show_debug_message("Próxima onda iniciada: " + string(wave_atual));