ONE_TO_FOUR = (1..4).to_a
blank_puzzle = [0,0,0,0]


def solve(puzzle)
  puzzle.each_with_index{|col, index|
    guess = perm_val(puzzle)
    p "guess: #{guess}"
    if guess.length == 1
      puzzle[index] = guess.first
      if solved?
        p puzzle
      end
    else
        guess.each{|guess_value| new_puzzle = puzzle.dup
          new_puzzle[index] = guess_value
          p "new_puzzle: #{new_puzzle}"
          solve(new_puzzle)
        }
    end
  }
end


def perm_val(puzzle)
  ONE_TO_FOUR - puzzle
end
