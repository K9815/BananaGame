switch (state){
	case "move":
		#region Move State
		// Velocidade do jogador
		var speedmov = 3;

		// Movimento para a esquerda
		if (keyboard_check(vk_left) || keyboard_check(ord("A"))) and not place_meeting(x-speedmov, y, o_parede){
		    x -= speedmov;
		    image_xscale = -2;
		    sprite_index = spr_plwalk;
			image_speed = 0.2;
		}

		// Movimento para a direita
		if (keyboard_check(vk_right) || keyboard_check(ord("D"))) and not place_meeting(x+speedmov, y, o_parede){
		    x += speedmov;
		    image_xscale = 2;
		    sprite_index = spr_plwalk;
			image_speed = 0.2
		}
		
		if not (keyboard_check(vk_right) || keyboard_check(ord("D"))) and not (keyboard_check(vk_left) || keyboard_check(ord("A"))){
			sprite_index = spr_plidle;
			image_speed = 0.2;
		}
		
		//ataque
		if keyboard_check_pressed(vk_lshift){
			image_index = 0;
			state = "attack one";
			image_speed = 0.6
		}
		#endregion
		break;
	
	case "attack one":
		#region Attack State
		sprite_index = spr_platq;
		#endregion
		break;
}