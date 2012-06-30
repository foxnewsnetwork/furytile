Furytile
=
More tile-service, this time it will incorporate HTML5 elements as well.

Notes on Usage
=
As a programmer, it is up to you maintain a reasonable workflow that others can learn and produce.
Furytile is currently a simple haxe-based game engine which aims to be eventually like rails (except
for games). In order to accomplish that, a rigorous workflow and architecture is required. As of right
now, the structure is as follows : 

PACKAGE buildingblocks 
(contains the most basic html5 manipulation tools)

PACKAGE game
(contains a layer of abstraction above buildingblocks and outlines the very basics of game-building)

PACKAGE specfactory
(contains factories for generating other package objects for testing)

PACKAGE furytest
(contains integration tests for other packages. All the static main functions for haxe compiler
targetting lives in these files)

PACKAGE tools
(contains generic static tools for simple and mundane tasks such as random text generation, etc.)

PACKAGE haxespec
(contains extensions of the standard haxe.unit.testCase class)

For reliability reasons, each package also ships with a xxxspec package for testing. 

For simple serialization and cross-platform communication, each class also ships with and xxxdata
package which contains all the members of a class with the idea being that it would be easy to 
serialize data of any given class to be shipped off through some pipeline somewhere else\

Notes on Cross-platforming
=
Because Furytile is built with the original intention of running html5 and so heavily utilizes the canvas
and other such tools, cross-platforming it to compile and work somewhere else (even with haxe) will
be  tricky. But it can be done. As of right now, the only files that must be adapted to other platform
are as follows:

1. buildingblocks package
2. game.Interaction.hx
3. gamespec.InteractionSpec.hx

That's quite a lot, but it can't be helped since canvas is different from the other beasts -_-
