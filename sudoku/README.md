Solve Sudoku
=============

This is an algorithmic solution for an exact-cover problem bound by the rules of Sudoku.

More on exact-covers can be found here: https://en.wikipedia.org/wiki/Exact_cover

The rules for the standard 9x9 Sudoku are as follows:

- Each cell can only contain exactly one number in the range between 1-9 inclusive
- Each row must contain exactly the numbers 1 through to 9
- Each column can only contain exactly the numbers 1 through to 9
- Each 3x3 sub-grid can only contain exactly the numbers 1 through to 9

The skeleton for the solution was adapted from the solution to the 8-queens problem outlined in Scheme in SICP, which can be found here: https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-15.html

In this section of the book, the author discusses the advantages of decoupling time-states from an algorithm by pushing that complexity "into the machine" and my solution is my first attempt at implementing such a strategy.





Installation
--------------
All the code for this project is written in ruby, so Ruby itself is required. RVM is also recommended, Ruby >= 2.2.3 should be used. Instructions for getting RVM can be found at: 
https://rvm.io/
The testing suite used was RSpec, this can be obtained by running the command (after getting RVM):
``` gem install rspec ```

