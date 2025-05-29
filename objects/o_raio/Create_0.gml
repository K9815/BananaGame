x_dest = x;
y_dest = y;
image_angle = point_direction(x, y, x_dest, y_dest);
image_xscale = point_distance(x, y, x_dest, y_dest) / sprite_width;
image_alpha = 1;
alarm[0] = 10;