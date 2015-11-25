(ns p-e-clj.problem2)

(defn nFibs [n]
  (cond
    (= n 1) [1]
    (= n 2) [1 2]
    :else (conj (nFibs (- n 1))
                (+ (nth (nFibs (- n 1)) (- n 2))
                   (nth (nFibs (- n 1)) (- n 3))))))

(defn nthFib [n]
  (cond
    (= n 1) 1
    (= n 2) 2
    :else (+ (nthFib (- n 1))
             (nthFib (- n 2)))))

(defn fibsUpToLim [n & [i]]
  (if i
    (if (> (nthFib i) n)
      (nthFib (- i 1))
      (fibsUpToLim n (+ i 1)))
    (fibsUpToLim n 1)))

(defn evenFibsUpToLim [n & [i fibList]]
  (if (and i fibList)
    (if (> (nthFib i) n)
      (filter even? fibList)
      (evenFibsUpToLim n
                       (+ i 1)
                       (conj fibList (nthFib i))))
    (evenFibsUpToLim n 1 [])))

;soln
(reduce (fn [firstElement secondElement]
            (+ firstElement secondElement))
        (evenFibsUpToLim 4000000))