(define (make-accumulator balance)
  (lambda (x) (set! balance (+ balance x))
    balance))

;; tests

(define A (make-accumulator 5))
(A 10)
(A 10)
(A 5)
