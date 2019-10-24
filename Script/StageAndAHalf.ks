declare global function StageAndAHalf {
	local skirtMass is ship:partstagged("BoosterEngine"):mass + ship:partstagged("skirt"):mass.
	local pMass is terminal:input.
	local rocketMass is vessel:wetmass - pMass.
	local postSepDryMass is vessel:drymass - pMass - skirtMass
	local sustainerThrust is ship:partstagged("sustainer"):maxthrust.
	local flowRate is ((ship:partstagged("BoosterEngine"):fuelflow) + (ship:partstagged("sustainer"):fuelflow)).
	local sustainerFlowrate is flowRate - (ship:partstagged("BoosterEngine"):fuelflow).
	local fuelStuff is ((ship:partstagged("tankage"):resources:name("LiquidFuel")amount) + (ship:partstagged("tankage"):resources:name("Oxidizer"):amount)).
	lock postSepTWR to (sustainerThrust * 224.809) / (postSepDryMass * 2204.62).
	
	when postSepTWR > 1.1 then {
		stage.
		print "Booster Skirt Jettisoned!"
	}
}.
