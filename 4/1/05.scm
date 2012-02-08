;; expand-clauses
(define (expand-clauses clauses)
  (if (null? clauses)
      'false ; no else clause
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last -- COND->IF"
                       clauses))
            (let ((predicate (cond-predicate first)))
              (make-if predicate
                       (cond-consequent (cond-actions first) predicate)
                       (expand-clauses rest)))))))

(define (cond-consequent actions predicate)
  (if (eq? (car actions) '=>)
      (list (cadr actions) predicate)
      (sequence->exp actions)))
