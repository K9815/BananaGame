tempo_spawn = 90; 
contador_spawn = 0;

lista_inimigos = [ o_cenoura, o_tomate ];

wave_atual = 1;
inimigos_derrotados = 0;
inimigos_por_wave = 5; // Aumenta a cada wave
wave_em_progresso = true;

habilidades = [
    {
        nome: "Velocidade de Ataque",
        tipo: "velocidade_ataque",
        nivel: 0,
        max_nivel: 5,
        sprite: VelocidadeAtaque
    },
    {
        nome: "Corrente Elétrica",
        tipo: "corrente_eletrica",
        nivel: 0,
        max_nivel: 5,
        sprite: CorrenteEletrica
    },
    {
        nome: "Vampirismo",
        tipo: "vampirismo",
        nivel: 0,
        max_nivel: 5,
        sprite: Vampirismo
    },
    {
        nome: "Resistência Aumentada",
        tipo: "resistencia",
        nivel: 0,
        max_nivel: 5,
        sprite: ResistenciaAumentada
    },
    {
        nome: "Vida Aumentada",
        tipo: "vida_maxima",
        nivel: 0,
        max_nivel: 5,
        sprite: VidaAumentada
    }
];
