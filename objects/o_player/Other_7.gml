if state == "attack one"{
	state = "move";
	image_index = 0;
}

if state == "dead" {
	room_restart();
}