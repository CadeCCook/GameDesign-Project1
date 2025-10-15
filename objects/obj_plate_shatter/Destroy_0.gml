if (lives <= 0) {
	room_goto(rm_gameover)
	lives = 5
	audio_stop_sound(Game_Soundtrack)
}