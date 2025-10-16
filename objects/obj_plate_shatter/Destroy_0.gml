if (lives <= 0) {
	room_goto(rm_gameover)
	lives = global.starting_lives
	audio_stop_sound(Game_Soundtrack)
}