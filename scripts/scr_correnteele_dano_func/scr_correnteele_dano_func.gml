/// @function scr_corrente_dano_ao_redor(gatilho_x, gatilho_y, raio, qtd_maxima, dano)
/// Aplica dano em inimigos ao redor da posição (gatilho_x, gatilho_y)

var _x = argument0;
var _y = argument1;
var _raio = argument2;
var _quantidade = argument3;
var _dano = argument4;

// Valor de segurança caso _quantidade esteja undefined
if (!is_real(_quantidade)) {
    _quantidade = 3; // valor padrão de emergência
}

// Coletar inimigos ao redor
var inimigos = array_create(0);

with (o_cenoura) {
    if (!morrendo && point_distance(x, y, _x, _y) <= _raio) {
        array_push(inimigos, id);
    }
}

with (o_tomate) {
    if (!morrendo && point_distance(x, y, _x, _y) <= _raio) {
        array_push(inimigos, id);
    }
}

// Sortear até a quantidade máxima
var total = min(array_length(inimigos), _quantidade);

for (var i = 0; i < total; i++) {
    var alvo = inimigos[i];
    with (alvo) {
        if (object_index == o_cenoura) {
            tomar_dano_cenoura(_dano);
        } else if (object_index == o_tomate) {
            tomar_dano_tomate(_dano);
        }
        // Efeito visual do raio
		var efeito = instance_create_layer(x, y, "Efeitos", o_raio);
		efeito.x_dest = alvo.x;
		efeito.y_dest = alvo.y;
    }
}
