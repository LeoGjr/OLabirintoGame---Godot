extends KinematicBody

var vrotacao = 2
var vmovimento = 8
var fimdejogo = 0

func _ready():
	pass

func atualizafimdejogo(novovalor):
	fimdejogo = novovalor
	
func _physics_process(delta):
	if fimdejogo == 0:
		var rotacao = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
		var profundidade = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		rotation.y += rotacao * vrotacao * delta
		var direcao = Vector3(0,0,1).rotated(Vector3(0,1,0),rotation.y)
		var movimento = direcao * vmovimento * profundidade * delta
		move_and_collide(movimento)
