// Base do joystick
draw_set_alpha(0.5);
draw_circle(joystick_center_x, joystick_center_y, joystick_radius, false);

// Botão do joystick
draw_set_alpha(1);
draw_circle(stick_x, joystick_center_y, 20, false);
