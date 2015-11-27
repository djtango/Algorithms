require 'solve_sudoku'

describe 'Sudoku Solver:' do

  let(:sudoku1) {[ [ [1], [5], [9],    [ ], [8], [ ],     [7], [ ], [ ] ],
                   [ [4], [ ], [ ],    [ ], [ ], [7],     [3], [5], [9] ],
                   [ [ ], [3], [ ],    [9], [2], [5],     [ ], [8], [ ] ],

                   [ [8], [ ], [ ],    [3], [9], [ ],     [ ], [1], [7] ],
                   [ [6], [ ], [1],    [ ], [5], [2],     [ ], [9], [ ] ],
                   [ [3], [ ], [7],    [ ], [1], [ ],     [2], [ ], [5] ],

                   [ [ ], [1], [ ],    [2], [7], [ ],     [9], [ ], [4] ],
                   [ [ ], [6], [3],    [8], [ ], [ ],     [5], [ ], [2] ],
                   [ [ ], [7], [4],    [5], [ ], [9],     [ ], [6], [ ] ] ]
                 }

  let(:sudoku2) { [ [ [1], [2], [3],    [ ], [ ], [ ],     [ ], [ ], [ ] ],
                    [ [4], [5], [6],    [ ], [ ], [ ],     [ ], [ ], [ ] ],
                    [ [7], [8], [ ],    [ ], [ ], [ ],     [ ], [ ], [ ] ],
      
                    [ [ ], [ ], [9],    [ ], [ ], [ ],     [ ], [ ], [ ] ],
                    [ [ ], [ ], [ ],    [ ], [ ], [ ],     [ ], [ ], [ ] ],
                    [ [ ], [ ], [ ],    [ ], [ ], [ ],     [ ], [ ], [ ] ],
      
                    [ [ ], [ ], [ ],    [ ], [ ], [ ],     [ ], [ ], [ ] ],
                    [ [ ], [ ], [ ],    [ ], [ ], [ ],     [ ], [ ], [ ] ],
                    [ [ ], [ ], [ ],    [ ], [ ], [ ],     [ ], [ ], [ ] ] ]
  }

  let(:sk3)   { [ [ [8], [6], [3],    [2], [ ], [ ],     [ ], [1], [ ] ],
                  [ [1], [ ], [ ],    [8], [5], [3],     [ ], [6], [ ] ],
                  [ [5], [ ], [ ],    [ ], [ ], [7],     [3], [8], [4] ],

                  [ [ ], [9], [ ],    [ ], [8], [ ],     [1], [7], [5] ],
                  [ [4], [ ], [ ],    [7], [3], [ ],     [ ], [ ], [9] ],
                  [ [7], [5], [2],    [1], [6], [ ],     [ ], [ ], [3] ],

                  [ [ ], [ ], [7],    [5], [2], [8],     [4], [9], [ ] ],
                  [ [ ], [8], [5],    [ ], [ ], [1],     [7], [ ], [ ] ],
                  [ [ ], [4], [1],    [ ], [ ], [6],     [2], [ ], [8] ] ]
  }
  
  let(:sk3_soln)  { [ [ [8], [6], [3],    [2], [9], [4],     [5], [1], [7] ],
                      [ [1], [7], [4],    [8], [5], [3],     [9], [6], [2] ],
                      [ [5], [2], [9],    [6], [1], [7],     [3], [8], [4] ],

                      [ [3], [9], [6],    [4], [8], [2],     [1], [7], [5] ],
                      [ [4], [1], [8],    [7], [3], [5],     [6], [2], [9] ],
                      [ [7], [5], [2],    [1], [6], [9],     [8], [4], [3] ],

                      [ [6], [3], [7],    [5], [2], [8],     [4], [9], [1] ],
                      [ [2], [8], [5],    [9], [4], [1],     [7], [3], [6] ],
                      [ [9], [4], [1],    [3], [7], [6],     [2], [5], [8] ] ]
  }

  
let(:sk4)     { [ [ [ ], [ ], [ ],    [2], [ ], [9],     [ ], [3], [8] ],
                  [ [3], [ ], [4],    [6], [ ], [ ],     [ ], [ ], [ ] ],
                  [ [8], [6], [ ],    [ ], [ ], [5],     [ ], [ ], [1] ],

                  [ [6], [ ], [1],    [ ], [2], [ ],     [ ], [ ], [ ] ],
                  [ [ ], [ ], [ ],    [ ], [5], [ ],     [7], [ ], [6] ],
                  [ [ ], [ ], [5],    [ ], [7], [ ],     [ ], [ ], [2] ],

                  [ [ ], [5], [ ],    [8], [ ], [ ],     [1], [ ], [ ] ],
                  [ [4], [ ], [9],    [5], [ ], [ ],     [ ], [6], [ ] ],
                  [ [ ], [8], [ ],    [ ], [ ], [4],     [5], [ ], [ ] ] ]

}

  let(:sk4_best_before_guessing) {
      [ [ [5], [1], [7],    [2], [4], [9],     [6], [3], [8] ],
        [ [3], [9], [4],    [6], [8], [1],     [2], [ ], [ ] ],
        [ [8], [6], [2],    [7], [3], [5],     [ ], [ ], [1] ],
        [ [6], [ ], [1],    [ ], [2], [ ],     [ ], [ ], [ ] ],
        [ [2], [ ], [ ],    [ ], [5], [ ],     [7], [ ], [6] ],
        [ [9], [ ], [5],    [ ], [7], [ ],     [ ], [ ], [2] ],
        [ [7], [5], [ ],    [8], [ ], [ ],     [1], [ ], [ ] ],
        [ [4], [ ], [9],    [5], [1], [ ],     [ ], [6], [ ] ],
        [ [1], [8], [ ],    [ ], [ ], [4],     [5], [ ], [ ] ] ] 

  }
  
  let(:sk4_soln)   { [ [ [5], [1], [7],    [2], [4], [9],     [6], [3], [8] ],
                       [ [3], [9], [4],    [6], [8], [1],     [2], [7], [5] ],
                       [ [8], [6], [2],    [7], [3], [5],     [9], [4], [1] ],

                       [ [6], [7], [1],    [4], [2], [8],     [3], [5], [9] ],
                       [ [2], [4], [8],    [9], [5], [3],     [7], [1], [6] ],
                       [ [9], [3], [5],    [1], [7], [6],     [4], [8], [2] ],

                       [ [7], [5], [3],    [8], [6], [2],     [1], [9], [4] ],
                       [ [4], [2], [9],    [5], [1], [7],     [8], [6], [3] ],
                       [ [1], [8], [6],    [3], [9], [4],     [5], [2], [7] ] ]

  }  
  context 'getting started:' do

    it 'is able to return all entries in the same row' do
      expect(same_row(sudoku1, 4)).to eq ([6,1,5,2,9])
    end

    it 'is able to return all entries in the same column' do
      expect(same_column(sudoku1, 4)).to eq([8,2,9,5,1,7])
    end

    it 'is able to return all entries in the same box' do
      expect(same_box(sudoku1, 4, 4)).to eq([3,9,5,1,2])
    end

    it 'can therefore deduce what values are allowed in a given cell' do
      expect(permissible_values(sudoku1, 0, 3)).to eq([4,6])
    end

  end

  context 'base case tests:' do

    it 'can recognise when it is at the end of a grid' do
      expect(end_of_grid?(8, 9)).to eq true
    end

    it 'can recognise when the current permutation is insoluble' do
      expect(insoluble?(sudoku2, 2, 2)).to eq true
    end

    it 'can recognise when the current cell is filled' do
      expect(filled?(sudoku2, 0, 0)).to eq true
    end

  end

  context 'searching for a solution' do

    it 'can create a deep-clone of the sudoku array' do
      expect(update_sudoku(sudoku1, 1, 0, 0)).to eq sudoku1
    end

    it 'algorithm can fill in a sudoku with all definite solutions' do
      expect(fill_in(sk3)).not_to eq sk3
    end

    it 'algorithm will sieve out all the definite answers until it solves the sudoku' do
      expect(sieve_sudoku(sk3)).to eq sk3_soln
    end

    it 'if the algorithm cannot solve the sudoku with sieve, it will keep going until there are no more definite answers' do
      expect(sieve_sudoku(sk4)).to eq sk4_best_before_guessing
    end

    it 'the algorithm will start guessing when there are no more definite answers' do

    end
  end
end
