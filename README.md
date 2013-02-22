missionname
===========

Military secret mission name generator
A silly project by Russell Champoux
Written in February 2013

I wrote this project while watching my roommate play XCOM. I figured that I could come up with some even sillier mission names than they had.

To run:

* Load mission.rb (using "require './mission.rb') either in your own script or in irb
* Get a mission name by calling "Mission.get_name()"

* You may add your own values into 'adjectives.txt', 'nouns.txt', 'colors.txt', and 'colors.txt'
* Values following a pipe ('|') in adjectives.txt denotes nouns that should NOT be used with this adjective

* You may add new grammars to 'grammars.txt' to change how mission names are constructed
* The value before the pipe in grammars.txt represents the probability that grammar will be selected
* The string after the pipe is the grammar followed when constructing the mission name
* Possible values to reference when constructing a new grammar include the following: adj, adj2, noun, noun2, color, animal

