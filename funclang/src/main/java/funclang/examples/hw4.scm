$ (= "abc" "abc")
#t
$ (= "abc" "abcdef")
#f
$ (> "abc" "abcd")
#f
$ (< "abc" "abcdef")
#t
$ (= #t #t)
#t
$ (= #t #f)
#f
$ (= (list) (list))
#t
$ (= (list 1 2 3 4) (list 1 2 3 4))
#t
$ (= (list 1 2 3 4) (list 1 2 3 4 5))
#f
$ (= (list 1 2 3 4 (list)) (list 1 2 3 4 (list)))
#t
$ (= (car (list 1 2 3)) 1)
#t
$ (= (car (list 1 2 3)) 2)
#f
$ (= (cdr (list 1 2 3)) 2) Your input is broken (= (cdr (list 1.0 2.0 3.0 )) 2.0)
#f
$ (= (cdr (list 1 2 3)) (list 2 3))
#t
$ (= (cdr (list 1 2 3)) (cdr (list 4 2 3)))
#t
$ (= (cons 0 (list 1 2)) (list 0 (list 1 2)))
#f
$ (= (cons 0 (list 1 2)) (list 0 1 2))
#t
$ (> (list 1 2) (list))
#t
$ (> (list) (list 1))
#f
$ (< (list 1 2) (cdr (list 2 3 4 5)))
#t

