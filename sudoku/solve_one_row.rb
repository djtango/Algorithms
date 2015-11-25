ONE_TO_FOUR = (1..4).to_a

def permissible_values(puzzle, row, column)
  ONE_TO_FOUR - same_row(puzzle, row) - same_column(puzzle, column)
end

def same_row(puzzle, row)
  puzzle[row].flatten
end


def same_column(sudoku, column)
  sudoku.transpose[column].flatten
end

blank_puzzle = [ [[ ], [ ], [ ], [ ]] ]

permissible_values(blank_puzzle, 0)

one_puzzle = [ [[1], [ ], [ ], [ ]] ]

two_puzzle = [ [[1], [ ], [ ], [4]] ]

permissible_values(one_puzzle, 0)
permissible_values(two_puzzle, 0)

def solve(puzzle, row = 0, column = 0)
  return blah if puzzle.length == 0
  return nil if permissible_values(puzzle, 0).length == 0
  permissible_values(puzzle, row, column).map{|soln| [soln, permissible_values(puzzle, row, column + 1)]}

end

create_new_puzzle