(ns p-e-clj.problem1-spec
  (:require [speclj.core :refer :all]
            [p-e-clj.problem1 :refer :all]))

(describe "PE Problem 1: Sum of Multiples"
  (it "'consecSum' can calculate the sum of consecutive numbers"
    (should=  5050
              (consecSum 100)))
  (it "'highestMultiple' can find the highest integer multiple in a limit"
    (should= 333
             (highestMultiple 1000 3)))
  (it "'sumOfMultiples' can calculate the sum of a series of multiples up to a limit"
    (should= 166833
      (sumOfMultiples 999 3))))

(run-specs)
