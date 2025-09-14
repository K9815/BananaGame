event_inherited(); // Se o_ui_parent tiver algum create importante

touch_id = -1;

// Posiciona o botão na parte inferior direita da tela
x = display_get_gui_width() - sprite_width - 100;
y = display_get_gui_height() - sprite_height - 100;

// Função 'input'
input = function (_touch_id_arg, _touch_x_arg, _touch_y_arg)
{
    touch_id = _touch_id_arg;
}
