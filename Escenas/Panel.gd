extends CanvasLayer


var monedas = 4
var vidas = 7
func _ready():
	var aux = get_tree().get_root().find_node("Monedas",true, false)
	for moneda in aux.get_children():
		moneda.connect("get_moneda", self, "update_moneda_text")
		
	var aux2 = get_tree().get_root().find_node("Cafeteras",true, false)
	for cafetera in aux2.get_children():
		cafetera.connect("get_cafe", self, "update_vida")
		
	var aux3 = get_tree().get_root().find_node("Calendarios",true, false)
	for calendario in aux3.get_children():
		calendario.connect("fin_mes", self, "delete")
	
	$Vidas_total.text = String(vidas)
	$Monedas_total.text = String(monedas)
	

func update_moneda_text():
	monedas += 1
	$Monedas_total.text = String(monedas)
	

func update_vida():
	vidas +=1
	$Vidas_total.text = String(vidas)

func delete():
	monedas -= 5
	vidas -= 1
	$Monedas_total.text = String(monedas)
	$Vidas_total.text = String(vidas)


