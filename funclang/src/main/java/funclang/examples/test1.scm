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


#random stuff im testing
(if (= (len (list 1 2 3 4 5 6)) 6) #t #f)


# test examples
(define append (lambda (lst1 lst2) (if (null? lst1) lst2 (if (null? lst2) lst1 (cons (car lst1) (append (cdr lst1) lst2))))))

(define factorial (lambda (n) (if (= n 1) 1 (* n (factorial (- n 1))))))

(define sumhelp (lambda (x n) (if (< x n) (+ x (sumhelp (+ 1 x) n)) n)))
(define sum (lambda (n) (if (= n 1) 1 (sumhelp 1 n))))

#high order
(define repeat (lambda (f n o) (if (= n 0) o (repeat f (- n 1) (f o)))))

(define pair (lambda (fst snd) (lambda (op) (if op fst snd))))
(define apair (pair 3 4))
(define first (lambda (p) (p #t)))

# currying
(define plus (lambda (x y) (+ x y)))

(define plusCurry (lambda (x) (lambda (y) (+ x y))))

