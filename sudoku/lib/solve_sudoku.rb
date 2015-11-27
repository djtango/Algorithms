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

def solve(sudoku)
  guess(sieve_sudoku(sudoku)).flatten.select{|solution| ! solution.nil? }.each_slice(9).each{|row| p row}
end

def guess(sudoku, row = 0, column = 0)
  return sudoku.flatten                 if end_of_grid?(row, column)
  return guess(sudoku, row + 1, 0)      if end_of_column?(column)
  return guess(sudoku, row, column + 1) if filled?(sudoku, row, column)
  return nil                            if insoluble?(sudoku, row, column)
  permissible_values(sudoku, row, column).map do |value|
    guess(update_sudoku(sudoku, value, row, column), row, column + 1)
  end
end

def update_sudoku(sudoku, value, row, column)
  new_sudoku = copy_sudoku(sudoku)
  new_sudoku[row][column] = [value]
  new_sudoku
end

def copy_sudoku(sudoku)
  sudoku.map{|row| row.map{|column| column}}
end

def end_of_grid?(row, column)
  end_of_row?(row) && end_of_column?(column)
end

def end_of_row?(row)
  row == LAST_ROW - 1
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
  new_sudoku = copy_sudoku(sudoku)
  new_sudoku.map.with_index do |row, row_index|
    row.map.with_index do |column, column_index|
      solution = permissible_values(new_sudoku, row_index, column_index)
      easy_and_not_filled?(solution, new_sudoku, row_index, column_index) ? [solution.first] : column
    end
  end
end

def easy_and_not_filled?(solution, sudoku, row, column)
  solution.length == 1 && ! filled?(sudoku, row, column)
end

def no_easy_solutions?(sudoku)
  sudoku.map.with_index do |row, row_index|
    row.map.with_index do |column, column_index|
      cell_filled_or_difficult?(sudoku, row_index, column_index)
    end
  end.flatten.reduce{|a, b| a && b}
end

def cell_filled_or_difficult?(sudoku, row, column)
  filled?(sudoku, row, column) || permissible_values(sudoku, row, column).length > 1
end
