(ns p-e-clj.problem1)

(defn consecSum [lim]
  (/ (* (+ lim 1)
        lim)
      2))

(defn highestMultiple [lim, multiple]
  (quot lim multiple))

(defn sumOfMultiples [lim, multiple]
  (* (consecSum (highestMultiple lim multiple))
      multiple))


(-  (+ (sumOfMultiples 999 3)
    (sumOfMultiples 999 5))
    (sumOfMultiples 999 15))