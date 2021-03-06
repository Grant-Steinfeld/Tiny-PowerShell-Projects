# Tic-Tac-Toe

Create a Python program called `tictactoe.ps1` that will play a single round of the game Tic-Tac-Toe.
The program should accept the following parameters:

* `-b`|`--board`: The optional state of the board for the play. This will be a string of 9 characters representing the 9 cells of the 3x3 board. The string should be composed only of `X` and `O` to denote a player occupying that cell or `.` to show that the cell is open. The default is 9 '.' as all cells are open.
* `-p`|`--player`: An optional player which must be either `X` or `O`.
* `-c`|`--cell`: An optional cell which must be in the range 1-9 (inclusive).

Here is the usage the program should print for `-h` or `--help`:

```
C:\> ./tictactoe.ps1 -h
usage: tictactoe.ps1 [-h] [-b str] [-p str] [-c int]

Tic-Tac-Toe

optional arguments:
  -h, --help            show this help message and exit
  -b str, --board str   The state of the board (default: .........)
  -p str, --player str  Player (default: None)
  -c int, --cell int    Cell 1-9 (default: None)
```

The program will print the state of the board plus any modifications to the state made by `--player` and `--cell` along with the final outcome of the game which can either be "No winner" or "{player} has won."

When run with no arguments, it should print a blank Tic-Tac-Toe board and "No winner":

```
C:\> ./tictactoe.ps1
-------------
| 1 | 2 | 3 |
-------------
| 4 | 5 | 6 |
-------------
| 7 | 8 | 9 |
-------------
No winner.
```

Given a valid `--player` trying to take an unoccupied `--cell`, the program should modify the state before printing the board and deciding the outcome:

```
C:\> ./tictactoe.ps1 -p X -c 1
-------------
| X | 2 | 3 |
-------------
| 4 | 5 | 6 |
-------------
| 7 | 8 | 9 |
-------------
No winner.
```

The program should error out for a bad `--board`:

```
C:\> ./tictactoe.ps1 -b ABC......
usage: tictactoe.ps1 [-h] [-b str] [-p str] [-c int]
tictactoe.ps1: error: --board "ABC......" must be 9 characters of ., X, O
```

Or a bad `--cell`:

```
C:\> ./tictactoe.ps1 -p X -c 10
usage: tictactoe.ps1 [-h] [-b str] [-p str] [-c int]
tictactoe.ps1: error: argument -c/--cell: invalid choice: 10 \
(choose from 1, 2, 3, 4, 5, 6, 7, 8, 9)
```

Or a bad `--player`:

```
C:\> ./tictactoe.ps1 -p A -c 1
usage: tictactoe.ps1 [-h] [-b str] [-p str] [-c int]
tictactoe.ps1: error: argument -p/--player: invalid choice: 'A' \
(choose from 'X', 'O')
```

Or in the event a `--player` is trying to take an occupied `--cell`:

```
C:\> ./tictactoe.ps1 -b X........ -p O -c 1
usage: tictactoe.ps1 [-h] [-b str] [-p str] [-c int]
tictactoe.ps1: error: --cell "1" already taken
```

Or if only `--player` or `--cell` is provided:

```
C:\> ./tictactoe.ps1 --player X
usage: tictactoe.ps1 [-h] [-b board] [-p player] [-c cell]
tictactoe.ps1: error: Must provide both --player and --cell
```

The program should detect a winning state:

```
C:\> ./tictactoe.ps1 -b .XX....OO -p X -c 1
-------------
| X | X | X |
-------------
| 4 | 5 | 6 |
-------------
| 7 | O | O |
-------------
X has won!
```
