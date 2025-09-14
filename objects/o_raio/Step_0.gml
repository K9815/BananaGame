image_alpha = 1;
// Move até o destino
var dist = point_distance(x, y, x_dest, y_dest);
var spd = 10; // velocidade do raio

if (dist > 4) {
    var dir = point_direction(x, y, x_dest, y_dest);
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);
} else {
    instance_destroy(); // destrói o raio ao chegar
}