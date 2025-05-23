// Avança para a próxima wave
wave_atual += 1;
inimigos_por_wave += 5;
inimigos_derrotados = 0;
wave_em_progresso = true;

// Pausa o jogo enquanto o jogador escolhe uma habilidade
global.jogo_pausado = true;

// Gera habilidades que ainda podem ser melhoradas
var candidatas = [];

for (var i = 0; i < array_length(habilidades); i++) {
    if (habilidades[i].nivel < habilidades[i].max_nivel) {
        array_push(candidatas, habilidades[i]);
    }
}

// 3 habilidades aleatórias
var escolhas = [];

while (array_length(escolhas) < 3 && array_length(candidatas) > 0) {
    var index = irandom(array_length(candidatas) - 1);
    array_push(escolhas, candidatas[index]);
    array_delete(candidatas, index, 1);
}

// Cria o objeto de seleção de habilidade e passa as opções geradas
var tela = instance_create_depth(0, 0, -100, o_selecaohab);
tela.habilidades_disponiveis = escolhas;
