// o_selecaohab - Step Event (Seu Código - AJUSTADO O ALARME)

// Lógica de navegação por teclado
var num_habilidades = array_length(habilidades_exibidas);

if (num_habilidades > 0) {
    // Navegar para a esquerda
    if (keyboard_check_pressed(vk_left)) {
        selecionada = max(0, selecionada - 1);
        //  Adicionar som de navegação
    }
    
    // Navegar para a direita
    if (keyboard_check_pressed(vk_right)) {
        selecionada = min(num_habilidades - 1, selecionada + 1);
        //  Adicionar som de navegação
    }

    // Selecionar habilidade
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        var habilidade_info = habilidades_exibidas[selecionada];
        show_debug_message("Habilidade '" + habilidade_info.nome + "' selecionada por teclado!");
        
        script_execute(habilidade_info.script_aplicar);
        
        // Ativa o alarme 0 do spawner para gerenciar a próxima wave
        if (instance_exists(o_spawner)) {
            // Mude para 1 para que a próxima fase da lógica de wave inicie no próximo frame do spawner
            o_spawner.alarm[0] = 1; 
        }
		
        global.jogo_pausado = false;
        
        // Destrói o objeto de seleção de habilidade
        instance_destroy();
        
    }
}