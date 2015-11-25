(ns p-e-clj.prime-sieve-spec
  (:require [speclj.core :refer :all]
            [p-e-clj.prime-sieve :refer :all]))

(describe "Sieve of Eratosthenes"
  (it "produces a list of primes"
    (should= '(2 3 5 7 11 13 17 19 23 29 31)
              (prime-list 11)))
  (it "can tell whether a number n is divisible by integer d"
      (should= false
               (not-divides? 2 4)))
  (it "can tell when a number n is not divisble by d"
      (should= true
               (not-divides? 2 5)))
 )

(run-specs)
