(define f
  (let ((state 0))
    (lambda (n)
      (let ((state-internal state))
        (set! state n)
        state-internal))))

;; tests

(+ (f 1) (f 0))
(+ (f 0) (f 1))
