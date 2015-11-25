(ns p-e-clj.prime-sieve)

(defn not-divides? [d n]
  (not (= 0 (mod n d))))

(defn prime-sieve [int-list]
  (lazy-seq
    (cons
      (first int-list)
      (prime-sieve (filter
                     ((fn [x] (partial not-divides? x)) (first int-list))
                     int-list)))))


(defn prime-list [n]
  (take n (prime-sieve (drop 2 (range)))))

