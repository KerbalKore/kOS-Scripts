clearscreen.
print "Getting data...".
run launchfunctions.
set tgtHeading to heading(90,90).
lock steering to tgtHeading.
set tgtThrot to 1.0.
lock throttle to tgtThrot
Liftoff().
Staging().
//Ascent
Ascent(120,80,0.7).
print "Beginning velocity management..."
//Circularization and Vertical Velocity management
set tgtHeading to heading(90,0).
until ship:periapsis > 90000 {
	VerticalVelManager().
}
print ship:shipname + "has achieved an orbit of" + ((ship:apoapsis)/1000) + "by" + ((ship:periapsis)/1000)" + "km".