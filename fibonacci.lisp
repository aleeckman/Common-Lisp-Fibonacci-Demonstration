(defun nth-fib (n)
    ; Takes in a given number n and returns the nth number in Fibonacci sequence.
    
    (cond
    
    ((< n 2) n)
    
    ((>= n 2)
    (+ (nth-fib (- n 2)) (nth-fib (- n 1)))
    )
    )
)


(defun helper-fib (n prev_1 prev_2 fib_seq_list index) 
    ; Given a number n, the two-previously calculated numbers, as well as an index and an empty list,
    ; this function will recursively find the first n numbers of the Fibonacci sequence.
    
    (cond
    
    ((> index (- n 1))
    (reverse fib_seq_list)
    )
    
    ((<= index (- n 1))
    (helper-fib n prev_2 (+ prev_1 prev_2) (cons prev_1 fib_seq_list) (+ index 1))
    )
    )
)


(defun fib (n)
    ; Takes in a given number n calls the helper-fib function to calculate the first n numbers of the Fibonacci sequence.
   
   (helper-fib n 0 1 '() 0)
)


(defun fib-lt (n &optional (prev_1 0) (prev_2 1) (fib_seq_list ()))
    ; Given a number n and optionally similar inputs to that of helper-fib (excluding a given index), 
    ; this function recursively finds the numbers of the Fibonacci sequences that are less than a certain value. 
    
    (cond
    
    ((< n prev_1) 
    (reverse fib_seq_list)
    )
    
    ((>= n prev_1)
    (fib-lt n prev_2 (+ prev_1 prev_2) (cons prev_1 fib_seq_list))
    )
    )
)

; Test Cases
; (print (nth-fib 9))
; (print (fib 9))
; (print (fib-lt 9))
