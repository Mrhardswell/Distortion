local FORCE_MULTIPLIER = .6

return {
	Damping = .8,
	Stiffness = 0.55,
	Inertia = 0,
	Elasticity = .5,
	BlendWeight = 1,
	Radius = 0.2,
	AnchorDepth = 0,
	Force = Vector3.yAxis * FORCE_MULTIPLIER,
	Gravity = -Vector3.yAxis,
	WindDirection = -Vector3.xAxis,
	WindSpeed = 1,
	WindStrength = .5,
	WindInfluence = .5,
	AnchorsRotate = false,
	UpdateRate = 60,
	ActivationDistance = 100,
	ThrottleDistance = 30,
}
