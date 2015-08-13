# tetris-extended
Enhancements
1. In your game, the player can press the ’u’ key to make the piece that is falling rotate 180 degrees.
(Note it is normal for this to make some pieces appear to move slightly.)
2. In your game, instead of the pieces being randomly (and uniformly) chosen from the 7 classic pieces,
the pieces are randomly (and uniformly) chosen from 10 pieces. They are the classic 7 and these 3:
✷
✷✷
✷✷ ✷✷✷✷✷ ✷✷✷
The initial rotation for each piece is also chosen randomly.
3. In your game, the player can press the ’c’ key to cheat: If the score is less than 100, nothing happens.
Else the player loses 100 points (cheating costs you) and the next piece that appears will be:
✷
The piece after is again chosen randomly from the 10 above (unless, of course, the player hits ’c’ while
the “cheat piece” is falling and still has a large enough score). Hitting ’c’ multiple times while a single
piece is falling should behave no differently than hitting it once.
1
How To Run The Game
We recommend you not use irb to load tetris_runner.rb and start a game. We have not had success
getting the graphics library to restart properly more than once inside irb, so you would likely have to exit
the REPL after playing each game anyway. You can use the REPL for testing individual methods and
exploring the program, but to launch a game, go outside irb and run ruby tetris_runner.rb (or to make
sure the original unenhanced game still works correctly, run ruby tetris_runner.rb original). Make
sure the 4 Ruby files are in the same directory and run the ruby command (or irb when exploring) from
that directory.
