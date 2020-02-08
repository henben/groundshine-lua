This is a game that is intended to be like the classic Missile Command but with more player control over individual missiles,
and missile 'physics'.

The eventual goal is for the game to run on the PlayDate console. I don't have access to the PlayDate SDK yet, so
I'm implementing the game using the Lua [Love](https://love2d.org) framework, which I hope is similar to the PlayDate's
Lua support.

To simulate the PlayDate screen, the game runs at 400 x 240 resolution and will only use 1-bit black and white graphics.
To prevent the game window being tiny, it is currently scaled up.

Another limitation I'm going to adopt is drawing all the game graphics using Love API calls, with no pre-drawn sprite images
for a retro vector graphics look.

== To run

You should be able to run this in LÖVE 11.3. Not packaging it as a love file or executable as it has no entertainment value yet.

== Status

Player can aim and launch missiles with mouse and space (hold down to boost), make missiles explode with z, explosions disappear.

== Detailed game design document

You launch missiles from a base to shoot down incoming bombers, enemy bombs, enemy ICBMs and other enemies. Unlike in Missile Command and most of its
clones, you don't simply click or tap where the missile should go. 

You rotate your base (currently implemented with mouse, ultimately this will be done with the PlayDate crank).

Then you launch your missile by holding the launch button (space bar). When you release 'launch' (or the missile fuel runs out),
the missile moves ballistically under the influence of gravity. Detonating the missile is a separate button (Z for now).

Maybe you have multiple bases with a reload delay and can switch between them. Maybe you can upgrade bases/missiles with
an upgrade tree between waves (steer missile during boost phase, multi-warhead missiles, automated flak turrets or friendly fighters).

Instead of a score you have a counter showing how many people are still alive in the city you're defending. Direct detonations (yours
or from enemy weapons) kill lots of people, bombers/missiles crashing into the city cause a few casualties. Perhaps model radioactive
fallout.

== TODO

Add missile trails (first line then try particle effects)
Add limited boost time
Add extra particle 'smoke' around base at launch
Add enemies and collision detection
Camera zooms out as missile gets higher to increase play area
Explosion is divided into two zones, one that vaporises enemies, one that damages them (bombers crash, bombs diverted or fail to detonate?)


