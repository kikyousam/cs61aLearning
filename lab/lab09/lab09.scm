; (define (over-or-under num1 num2) 
;   (if (> num1 num2) 1 (if (= num1 num2) 0 -1))
; )

(define (over-or-under num1 num2) 
  (cond ((> num1 num2) 1 )
        ((= num1 num2) 0 )
        (else -1)
  )
)

(define (make-adder num) 
  (define (add ind)
    (+ ind num))
  add
)

; (define (make-adder num) 
;   (lambda (ind) (+ num ind))
; )

(define (composed f g) 
  (lambda (x) (f (g x)))
)

(define (repeat f n) 
  (if (> n 0)
    (lambda (x) ((repeat f (- n 1)) (f x)))
    (lambda (x) x)
  )
)


(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 
  (let ((c (max a b))
       (d (min a b)))
  (if (zero? d) 
      c
     (gcd d (modulo c d))
  ))
)

; (let (variables)
;   ())