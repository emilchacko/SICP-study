(define x (list 'a 'b))
(define z1 (cons x x))
z1
;; ((a b) a b)

;;           +---+---+
;;   z1 ---> | * | * |
;;           +---+---+
;;             |   |
;;             V   V
;;           +---+---+      +---+---+
;;    x ---> | * | *-|----> | * | / |
;;           +---+---+      +---+---+
;;             |              |
;;             V              V
;;           +---+          +---+
;;           | a |          | b |
;;           +---+          +---+

(define z2 (cons (list 'a 'b)
                 (list 'a 'b)))
z2
;; ((a b) a b)

;;           +---+---+      +---+---+      +---+---+
;;   z2 ---> | * | *-|----> | * | *-|----> | * | / |
;;           +---+---+      +---+---+      +---+---+
;;             |              |              |
;;             |              V              V
;;             |            +---+          +---+
;;             |            | a |          | b |
;;             |            +---+          +---+
;;             |              ^              ^
;;             |              |              |
;;             |            +---+---+      +---+---+
;;             +----------> | * | *-|----> | * | / |
;;                          +---+---+      +---+---+

(eq? (car z1) (cdr z1)) ; #t
(eq? (car z2) (cdr z2)) ; #f

(define (set-to-wow! x)
  (set-car! (car x) 'wow)
  x)

(set-to-wow! z1)
;; ((wow b) wow b)


;;           +---+---+
;;   z1 ---> | * | * |
;;           +---+---+
;;             |   |
;;             V   V
;;           +---+---+      +---+---+
;;    x ---> | * | *-|----> | * | / |
;;           +---+---+      +---+---+
;;             |              |
;;             V              V
;;           +-----+        +---+
;;           | wow |        | b |
;;           +-----+        +---+

(set-to-wow! z2)
;; ((wow b) a b)

;;           +---+---+      +---+---+      +---+---+
;;   z2 ---> | * | *-|----> | * | *-|----> | * | / |
;;           +---+---+      +---+---+      +---+---+
;;             |              |              |
;;             |              V              V
;;             |            +---+          +---+
;;             |            | a |          | b |
;;             |            +---+          +---+
;;             |                             ^
;;             |                             |
;;             |            +---+---+      +---+---+
;;             +----------> | * | *-|----> | * | / |
;;                          +---+---+      +---+---+
;;                            |
;;                            V
;;                         +-----+
;;                         | wow |
;;                         +-----+
