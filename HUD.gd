extends CanvasLayer

onready var tvitoria = get_node("textovitoria")
onready var tempo = get_node("tbackground/ttexto")

signal perdeu
signal reinicia
signal fimdejogo
func _ready():
	tvitoria.text = ""
	$reinicio.hide()
	
func _physics_process(delta):
	tempo.text = str(int($tempodejogo.time_left))

func _on_tempodejogo_timeout():
	emit_signal("perdeu")

func _on_reinicio_pressed():
	emit_signal("reinicia")
	
func perde():
	$perde.play()
	tvitoria.text = "Tempo esgotado"
	$reinicio.show()
	$tempodejogo.stop()
	emit_signal("fimdejogo")

func ganha():
	$ganha.play()
	tvitoria.text = "Você encontrou!"
	$reinicio.show()
	$tempodejogo.stop()
	emit_signal("fimdejogo")










