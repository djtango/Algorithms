ONE_TO_NINE = (1..9).to_a

def permissible_values(sudoku, row, column)
  ONE_TO_NINE - same_row(sudoku, row) - same_column(sudoku, column) - same_box(sudoku, row, column)
end

def same_row(sudoku, row)
  sudoku[row].flatten
end

def same_column(sudoku, column)
  sudoku.transpose[column].flatten
end

def same_box(sudoku, row, column)
  box_row = row / 3 * 3
  box_column = column / 3 * 3
  sudoku[box_row..box_row + 2].transpose[box_column..box_column + 2].flatten
end

def solve(sudoku, row, column)
  return sudoku.flatten if column == 3 && row == 3
  return nil if permissible_values(sudoku, row, column).empty?
  return solve(sudoku, row + 1, 0) if column == 3
  permissible_values(sudoku, row, column).map do |value|
    solve(update_sudoku(sudoku.dup, value, row, column), row, column + 1)
  end
end

def update_sudoku(sudoku, value, row, column)
  new_sudoku = Array.new(9).map{|row_item| Array.new(9).map{|col_item| [ ] } }
  sudoku.each_with_index do |sudoku_row, r_index|
    sudoku_row.each_with_index do |sudoku_col, c_index|
      new_sudoku[r_index][c_index] = sudoku_col.dup
    end
  end
  new_sudoku[row][column] = [value]
  new_sudoku
end

blank_3x3 = [ [ [ ], [ ], [ ] ],
              [ [ ], [ ], [ ] ],
              [ [ ], [ ], [ ] ] ]

solve(blank_3x3, 0, 0)
