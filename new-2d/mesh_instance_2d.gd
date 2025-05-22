extends MeshInstance2D

func _ready():
	if Global.skin_selected:
		var material = ShaderMaterial.new()  # ShaderMaterial für 2D-Mesh
		material.set_shader_parameter("texture", load(Global.skin_selected))
		mesh.material = material  # Wendet Skin-Textur an

	if Global.hat_selected:
		mesh = Global.hat_selected
		visible = true

		
