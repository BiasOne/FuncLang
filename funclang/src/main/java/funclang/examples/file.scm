(define counter (lambda (i lst) (if (null? lst) 0 (if (= (car lst) i) (+ 1 (counter i (cdr lst))) (counter i (cdr lst))))))
(define unique (lambda (lst) (if (null? lst) (list) (if (> (counter (car lst) lst) 1) (unique (cdr lst)) (cons (car lst) (unique (cdr lst)))))))
(define lst1 (list 1 2 3 4 1 1))
(let ((lst1 (unique lst1))) lst1)