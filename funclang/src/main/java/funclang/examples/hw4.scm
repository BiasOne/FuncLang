Q1
(define pi 3.14)
(define r 2)
(* (/ 3 4) (* r r r) pi)

Q2a.
(define len (lambda (lst) (if (null? lst) 0 (+ 1 (len (cdr lst))))))

Q2b.
(define counter (lambda (i lst) (if (null? lst) 0 (if (= (car lst) i) (+ 1 (counter i (cdr lst))) (counter i (cdr lst))))))
(define unique (lambda (lst) (if (null? lst) (list) (if (> (counter (car lst) lst) 1) (unique (cdr lst)) (cons (car lst) (unique (cdr lst)))))))

Q2c.
(define counter (lambda (i lst) (if (null? lst) 0 (if (= (car lst) i) (+ 1 (counter i (cdr lst))) (counter i (cdr lst))))))
(define unique (lambda (lst) (if (null? lst) (list) (if (> (counter (car lst) lst) 1) (unique (cdr lst)) (cons (car lst) (unique (cdr lst)))))))
(define len (lambda (lst) (if (null? lst) 0 (+ 1 (len (cdr lst))))))
(define pair (lambda (x y) (cons x y)))
(define pairup (lambda (lst1 lst2) (let ((lst1 (unique lst1))) (let ((lst2 (unique lst2))) (if (null? lst1) (list) (if (null? lst2) (list) (if (> (len lst2) (len lst1)) (list) (if (< (len lst2) (len lst1)) (list) (cons (pair (car lst2) (car lst1)) (pairup (cdr lst1) (cdr lst2)))))))))))

Q3a.
(define pair (lambda (fst snd) (lambda (op) (if op fst snd))))
(define apair (pair 3 4))
(define first (lambda (p) (p #t)))
(define second (lambda (p) (p #f)))
(define areequal (lambda (pair) (if (= (first pair) (second pair)) #t #f)))

Q3b.
(define quadraple (lambda (fst snd trd frth) (lambda (op) (if (= op 1) fst (if (= op 2) snd (if (= op 3) trd (if (= op 4) frth 0)))))))

Q4a.
(define mylist (list 1 2 3))

Q4b.
(define plus (lambda (x y) (+ x y)))
(define multiply (lambda (x y) (* x y)))
(define foldl (lambda (op zero lst) (if (null? lst) zero (foldl op (op zero (car lst)) (cdr lst)))))

Q4c.
(define foldl (lambda (op) (lambda (zero) (lambda (lst) (if (null? lst) zero (((foldl op) (op zero (car lst))) (cdr lst)))))))