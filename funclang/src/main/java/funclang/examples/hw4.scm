(switch (1) (case 1 2) (case 2 3) (default 4))
(define foo (lambda (var) (switch (var) (case 1 (+ var 2)) (case 2 (- var 2)) (case 3 (* var 2)) (case 4 (/ var 2)) (default var))))