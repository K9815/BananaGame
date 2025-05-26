// Posição fixa do centro do joystick na tela (GUI)
joystick_center_x = 150;
joystick_center_y = display_get_gui_height() - 150;

// Posição atual do "botão" do joystick
stick_x = joystick_center_x;
stick_y = joystick_center_y;

// Raio máximo que o botão pode se mover
joystick_radius = 60;

// Direção horizontal final (-1 = esquerda, 0 = parado, 1 = direita)
move_x = 0;

// Controle de toque
finger_id = -1;
is_dragging = false;
