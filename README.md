# README

#### Prerequisites

 * ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-darwin15]
 * OSx EL Captain 10.11.4 (Used as development machine)


#### Considerations

##### Code Exercise 1:
In the software language of your choice, and given standard algebraic notation of a chess board (see below), write code that will:
Accept two parameters:
of chess piece (Queen, Rook, Knight) Type on a chess board (for example: d2) Current position
Return:
A list of all the potential board positions the given piece could advance to, with one move, from the given position, with the assumption there are no other pieces on the board.
Rules:
You do not have to implement the solution for every piece type, but the solution must implement at least the following: Queen, Rook and Knight. You may not use any external/non-core libraries: use only primitives and built-ins for the chosen language. Please provide test coverage for your work.
Example:
If the code is passed: “knight, d2”
$ chessercise.rb -piece KNIGHT -position d2
The output should be: “b1, f1, b3, f3,c4, e4"
Algebraic Notation Legend:


##### Code Exercise 2:
Building on the elements from Exercise 1: Implement a “Target” mode with parameter. --target
Randomly place 8 (opposing) pieces onto the board tiles. Determine the physically from . Calculate and output the which the given most distant tile Current position minimum set of moves pie could take to the given that: ce Type most distant tile
Opposing pieces do not move. Opposing pieces may be “captured” along the way by moving to the occupied tile. Capturing an opposing piece marks the end of a “move”. Provide test coverage.

##### Setup/Installation

`SHELL
git clone 
cd 
gem install bundler
bundle install
ruby chessercise.rb -piece KNIGHT -position d2
ruby chessercise.rb -piece Knight -position d2 -target black
` 
Or you may have change mod of `chessercise.rb`

#### Tests 

To run tests `rspec .`  