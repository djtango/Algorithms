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

# permissible_values(blank_puzzle, 0)

# one_puzzle = [ [[1], [ ], [ ], [ ]] ]

# two_puzzle = [ [[1], [ ], [ ], [4]] ]

# permissible_values(one_puzzle, 0)
# permissible_values(two_puzzle, 0)

def solve(puzzle, row, column = 0)
  return puzzle.flatten if column == 4
  return nil if permissible_values(puzzle, row, column).empty?
  p "puzzle: #{puzzle}"
  p "row: #{row}"
  p "column: #{column}"
  blank_puzzle.each { |i_in_row|
    i_in_row.each { |i_in_column|
      permissible_values(puzzle, i_in_row, i_in_column).map do |value|
        solve(update_puzzle(puzzle.dup, value, row, column), row, column + 1)
    end
    }
  }
end

def update_puzzle(puzzle, value, row, column)
  new_puzzle = puzzle.clone
  p "value: #{value}"
  new_puzzle[row][column] = [value]
  p "new puzzle: #{new_puzzle}, row: #{row}, column: #{column}"
  p "old puzzle: #{puzzle}"
  new_puzzle
end

solve(blank_puzzle, 0, 0)
