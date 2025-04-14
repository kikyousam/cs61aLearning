(define (curry-cook formals body) 
    (if (= (length formals) 1) `(lambda ,formals ,body)
        `(lambda (,(car formals)) ,(curry-cook (cdr formals) body) )
    )
)

(define (curry-consume curry args)
    (if (null? args) curry
      (begin (define eat-one (curry (car args)))
             (curry-consume eat-one (cdr args))
      )
    )
  )

(define-macro (switch expr options)
  (switch-to-cond (list 'switch expr options)))


(define (switch-to-cond switch-expr)
  (cons 'cond
        (map (lambda (option)
               (cons `(equal? ,(car (cdr switch-expr)) ,(car option)) (cdr option)))
             (car (cdr (cdr switch-expr))))))

; (define (switch-to-cond switch-expr)
;   (cons 'cond
;         (map (lambda (option)
;                (cons `(equal? ,(cadr switch-expr) ,(car option)) 
;                      (cdr option)))
;              (caddr switch-expr))))
