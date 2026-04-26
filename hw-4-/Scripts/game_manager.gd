extends Node

var has_fuse: bool = false
var fuse_installed: bool = false
var generator_fixed: bool = false

func can_open_final_room() -> bool:
	return generator_fixed
