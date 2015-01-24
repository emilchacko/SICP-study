(load "35_evaluator.scm")

(define the-global-environment (setup-environment))

(interpret '(define (require p) (if (not p) (amb))))

(interpret '(define (distinct? items)
              (cond ((null? items) true)
                    ((null? (cdr items)) true)
                    ((member (car items) (cdr items)) false)
                    (else (distinct? (cdr items))))))

(interpret '(define (multiple-dwelling-reordered)
              (let ((baker (amb 1 2 3 4 5))
                    (cooper (amb 1 2 3 4 5))
                    (fletcher (amb 1 2 3 4 5))
                    (miller (amb 1 2 3 4 5))
                    (smith (amb 1 2 3 4 5)))
                (require (> miller cooper))
                (require (not (= baker 5)))
                (require (not (= cooper 1)))
                (require (not (= fletcher 5)))
                (require (not (= fletcher 1)))
                (require (not (= (abs (- smith fletcher)) 1)))
                (require (not (= (abs (- fletcher cooper)) 1)))
                (require
                 (distinct? (list baker cooper fletcher miller smith)))
                (list (list 'baker baker)
                      (list 'cooper cooper)
                      (list 'fletcher fletcher)
                      (list 'miller miller)
                      (list 'smith smith)))))

(define start-time (runtime))
(interpret '(multiple-dwelling-reordered))
(display (- (runtime) start-time))

(newline)

(interpret '(define (multiple-dwelling-efficient)
              (let ((cooper (amb 2 3 4 5))
                    (miller (amb 3 4 5)))
                (require (> miller cooper))
                (let ((fletcher (amb 2 3 4)))
                  (require (not (= (abs (- fletcher cooper)) 1)))
                  (let ((smith (amb 1 2 3 4 5)))
                    (require (not (= (abs (- smith fletcher)) 1)))
                    (let ((baker (amb 1 2 3 4)))
                      (require
                       (distinct? (list baker cooper fletcher miller smith)))
                      (list (list 'baker baker)
                            (list 'cooper cooper)
                            (list 'fletcher fletcher)
                            (list 'miller miller)
                            (list 'smith smith))))))))

(define start-time (runtime))
(interpret '(multiple-dwelling-efficient))
(display (- (runtime) start-time))
