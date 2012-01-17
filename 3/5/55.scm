;; mit-scheme

;; partial-sums
(define (partial-sums s)
  (cons-stream (stream-car s)
               (add-streams (stream-cdr s)
                            (partial-sums s))))

;; integers
(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))

;; add-streams
(define (add-streams s1 s2)
  (stream-map + s1 s2))

;; tests

(stream-ref (partial-sums integers) 4)

;1 ]=> (load "55.scm")
;
;;Loading "55.scm"... done
;;Value: 15