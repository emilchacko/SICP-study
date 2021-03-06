;; nil

(define nil '())

;; subsets
;;
;; appends:
;; 1) the set of all subsets excluding the first element
;; 2) the set of all subsets excluding the first element,
;;    with first element cons'ed onto them

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest
                (map (lambda (x) (cons (car s) x))
                     rest)))))

;; tests

(subsets '(3))
(subsets '(2 3))
(subsets '(1 2 3))
