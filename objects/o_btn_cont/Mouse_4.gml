instance_destroy(); // destrói o menu
instance_destroy(o_btn_sairm); // destrói o outro botão também, se já estiver instanciado
instance_destroy(self); // destrói este botão
global.jogo_pausado = false; // despausa o jogo

