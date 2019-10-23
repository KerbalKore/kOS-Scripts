declare global function VerticalVelManager {
	when ship:verticalspeed > 0 then {
		set tgtHeading to (90,-45).
		preserve.
	}.
	when ship:verticalspeed < 0 then {
		set tgtHeading to (90,45)
		preserve.
	}.
}.
declare global function Liftoff {
	//Countdown
	print "Counting down:".
	from {local countdown is 10.} until countdown = 0 step {set countdown to countdown - 1.} DO {
		print "..." + countdown.
		wait 1. // pauses the script here for 1 second.
	}.
	when countdown < 1 then {
		stage.
		print "Liftoff of " + ship:shipname + "at" + timespan:calendar + "!".
	}.
}.
declare global function Staging {
	//Autostaging
	when maxthrust = 0 then {
		print "Stage Sep".
		stage.
		preserve.
	}.
}.
declare global function Ascent {
	parameter turnStart.
	parameter startPitch.
	parameter pitchrate.
	
	wait until ship:velocity:surface:mag > turnStart.
	set tgtHeading to heading(90,startPitch).
	wait 10.

	until ship:apoapsis > 125000 {
		set tgtHeading to (90,startPitch - pitchrate).
		wait 1.
	}.
}.
