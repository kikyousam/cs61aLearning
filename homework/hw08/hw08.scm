(define (ascending? s) 
    (if (or (null? s) (= (length s) 1)) 
        True
        (if(> (car s) (car (cdr s)))
            False
            (ascending? (cdr s))
        )
    )
)

(define (my-filter pred s) 
   (if (null? s) nil
        (if (pred (car s)) 
            (cons (car s) (my-filter pred (cdr s)))
            (my-filter pred (cdr s))
   ) 
))

; (define (my-filter pred s) 
;    (if (null? s) nil
;         (let ((head (car s))
;               (tail (cdr s)))
;             (if (pred head)
;                 (cons head (my-filter pred tail))
;                 (my-filter pred tail)
;             )
;         )
;    ) 
; )
(define (interleave lst1 lst2) 
    (if (null? lst1) lst2
        (if (null? lst2) lst1
            (let ((tail (interleave (cdr lst1) (cdr lst2))))
                (cons (car lst1) (cons (car lst2) tail))
            )
        )
    )
)

(define (no-repeats s)
  (if (null? s)
      s
      (cons (car s)
            (no-repeats
             (filter (lambda (x) (not (= (car s) x))) (cdr s))))))
