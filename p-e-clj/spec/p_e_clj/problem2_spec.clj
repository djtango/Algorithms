((ns p-e-clj.problem2-spec
  (:require [speclj.core :refer :all]
            [p-e-clj.problem2 :refer :all]))

(describe "PE Problem 2: Even Fibonacci Numbers:"
  (it "'nFibs' can produce a list of n Fibonacci Numbers"
    (should= '(1 2 3 5 8 13 21 34 55 89)
      (nFibs 10)))
  (it "'fibsUpToLim' produces a list of Fibonacci Numbers up to a limit"
    (should= 144
      (fibsUpToLim 200)))
  (it "'evenFibsUpToLim produces a list of even Fibonacci Numbers up to a limit"
    (should= '(2 8 34 144)
      (evenFibsUpToLim 200))))
(run-specs))