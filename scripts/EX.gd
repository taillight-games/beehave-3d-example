class_name EX



static func RandomOnUnitSphere():
	return RandomVector3().normalized()

static func RandomInUnitSphere():
	return RandomVector3().move_toward(Vector3(0,0,0), randf());

static func RandomOnUnitCircleV3():
	var _v2 = RandomOnUnitCircle()
	return Vector3(_v2.x, 0, _v2.y)

static func RandomOnUnitCircle():
	var _rV3 : Vector3 = RandomVector3().normalized()
	var _rV2 : Vector2 = Vector2(_rV3.x, _rV3.y)
	var _angle : Vector2 = Vector2.ZERO.direction_to(_rV2)
	return _angle

static func RandomInUnitCircleV3():
	var _v2 = RandomInUnitCircle()
	return Vector3(_v2.x, 0, _v2.y)

static func RandomInUnitCircle():
	var _rV3 : Vector3 = RandomVector3().normalized()
	var _rV2 : Vector2 = Vector2(_rV3.x, _rV3.y)
	var _angle : Vector2 = Vector2.ZERO.direction_to(_rV2)
	return _angle * randf()


# Used by all functions to create a random vector3 point. 
# I stole it from stack overflow and converted it to GDScript, I don't know how it works
static func RandomVector3():
	var x0 : float = -1.0 + randf() * 2.0
	var x1 : float = -1.0 + randf() * 2.0
	var x2 : float = -1.0 + randf() * 2.0
	var x3 : float = -1.0 + randf() * 2.0
	while x0 * x0 + x1 * x1 + x2 * x2 + x3 * x3 >= 1:
		x0 = -1.0 + randf() * 2.0
		x1 = -1.0 + randf() * 2.0
		x2 = -1.0 + randf() * 2.0
		x3 = -1.0 + randf() * 2.0
	var a : float = x0*x0*x1*x1+x2*x2+x3*x3
	var x : float = 2*(x1 * x3+x0*x2)/a
	var y : float = 2*(x2*x3-x0*x1)/a
	var z : float = (x0*x0 + x3*x3 - x1*x1 - x2*x2)/a
	return Vector3(x,y,z)
