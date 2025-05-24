// Variáveis do Spawner e do Jogo
wave_atual = 1;
inimigos_por_wave = 1;
inimigos_derrotados = 0;
wave_em_progresso = true;
contador_spawn = 0;
tempo_spawn = 60; // 1 segundo = 60 frames
global.jogo_pausado = false; //Pausar ou Despausar

global.todas_habilidades = [
    {
        sprite: CorrenteEletrica,
        nome: "Corrente Elétrica",
        descricao: "Seus ataques têm chance de causar dano em área.",
        script_aplicar: scr_correnteele
    },
    {
        sprite: ResistenciaAumentada,
        nome: "Resistência Aumentada",
        descricao: "Reduz o dano recebido em 10%.",
        script_aplicar: scr_resisau
    },
    {
        sprite: Vampirismo,
        nome: "Vampirismo",
        descricao: "Cura 15% do dano causado.",
        script_aplicar: scr_vamp
    },
    {
        sprite: VelocidadeAtaque,
        nome: "Velocidade de Ataque",
        descricao: "Aumenta sua velocidade de ataque.",
        script_aplicar: scr_velatq
    },
    {
        sprite: VidaAumentada,
        nome: "Vida Aumentada",
        descricao: "Aumenta sua vida máxima em 20%.",
        script_aplicar: scr_vidaau
    }
];
