ONE_TO_NINE = (1..9).to_a

def permissible_values(puzzle, row, column)
  ONE_TO_NINE - same_row(puzzle, row) - same_column(puzzle, column)
end

def same_row(puzzle, row)
  puzzle[row].flatten
end


def same_column(sudoku, column)
  sudoku.transpose[column].flatten
end

def solve(puzzle, row = 0, column = 0)
  return puzzle.flatten if column == 9
  return nil if permissible_values(puzzle, row, column).empty?
  permissible_values(puzzle, row, column).map do |value|
    solve(update_puzzle(puzzle, value, row, column), row, column + 1)
  end
end

def update_puzzle(puzzle, value, row, column)
  new_puzzle = [[]].map{|row_item| Array.new(9).map{|col_item| [ ] } }
  puzzle.each_with_index do |puzzle_row, r_index|
    puzzle_row.each_with_index do |puzzle_col, c_index|
      new_puzzle[r_index][c_index] = puzzle_col.dup
    end
  end
  new_puzzle[row][column] = [value]
  new_puzzle
end


blank_puzzle = [ [[ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ]] ]

def first_n_solutions(solutions, n)
  solutions.first(n)
end

def benchmark(proc)
  start = Time.new
  proc.call
  "Time take: #{(Time.new - start).round(4)} seconds"
end
# one_by_nine = proc{solve(blank_puzzle, 0, 0)}

# arr124 = [ [[1], [2], [4], [ ]] ]
# permissible_values(blank_puzzle, 0)

# one_puzzle = [ [[1], [ ], [ ], [ ]] ]

# two_puzzle = [ [[1], [ ], [ ], [4]] ]

# permissible_values(one_puzzle, 0)
# permissible_values(two_puzzle, 0)
