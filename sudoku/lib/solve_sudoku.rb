ONE_TO_NINE = (1..9).to_a
LAST_ROW, LAST_COLUMN = 9, 9

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
  box_row, box_column = row / 3 * 3, column / 3 * 3
  sudoku[box_row..box_row + 2].transpose[box_column..box_column + 2].flatten
end

def solve(sudoku, row, column)
  return sudoku.flatten                 if end_of_grid?(row, column)
  return nil                            if insoluble?(puzzle, row, column)
  return solve(sudoku, row + 1, 0)      if end_of_column?(column)
  return solve(sudoku, row, column + 1) if filled?(sudoku, row, column)
  permissible_values(sudoku, row, column).map do |value|
    solve(update_sudoku(sudoku, value, row, column), row, column + 1)
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

def end_of_grid?(row, column)
  end_of_row?(row) && end_of_column?(column)
end

def end_of_row?(row)
  row == LAST_ROW
end

def end_of_column?(column)
  column == LAST_COLUMN
end

def insoluble?(sudoku, row, column)
  permissible_values(sudoku, row, column).empty? and not end_of_grid?(row, column)
end

def filled?(sudoku, row, column)
  ! sudoku[row][column].empty?
end

def sieve_sudoku(sudoku)
  return sudoku if no_easy_solutions?(sudoku)
  sieve_sudoku(fill_in(sudoku))
end

def fill_in(sudoku)
  filled_in_sudoku = update_sudoku(sudoku, sudoku[0][0].first, 0, 0)
  filled_in_sudoku.map.with_index do |row, row_index|
    row.map.with_index do |column, column_index|
      easy_soln = permissible_values(filled_in_sudoku, row_index, column_index)
      easy_soln.length == 1 && ! filled?(filled_in_sudoku, row_index, column_index) ? [easy_soln.first] : column
    end
  end
end

def no_easy_solutions?(sudoku)
  sudoku.map.with_index do |row, row_index|
    row.map.with_index do |column, column_index|
      filled?(sudoku, row_index, column_index) || permissible_values(sudoku, row_index, column_index).length > 1
    end
  end.flatten.reduce{|a, b| a && b}
end