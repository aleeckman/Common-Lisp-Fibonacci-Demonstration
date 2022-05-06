(defun handle-match (pattern-atom match-atom)
    (if (eql pattern-atom match-atom)
        (eval t)
        (eval nil)
    )
)

(defun handle-ast (pattern-atom-l match-atom-l)

    ;(print pattern-atom-l)
    ;(print (car match-atom-l))
    (cond
    
    ((or (and (null pattern-atom-l) (null match-atom-l)) (and (and (eql '#\* (car pattern-atom-l)) (eql 1 (length pattern-atom-l))) (null match-atom-l))) (eval t))
    
    ((or (null pattern-atom-l) (null match-atom-l)) (eval nil))
    
    ((handle-match (car pattern-atom-l) (car match-atom-l)) 
    (handle-ast (cdr pattern-atom-l) (cdr match-atom-l))
    )
    
    ((eql (car pattern-atom-l) '#\*)
    (or (or (handle-ast (cdr pattern-atom-l) (cdr match-atom-l)) (handle-ast pattern-atom-l (cdr match-atom-l)))
    (handle-ast (cdr pattern-atom-l) match-atom-l))
    )
    
    )
)


(defun match (pattern match)
	;(print pattern)
    ;(print match)
	
	(cond
	
	((or (and (null pattern) (null match)) (and (and (eql '! (car pattern)) (eql 1 (length pattern))) (null match))) (eval t))
	
	((or (null pattern) (null match)) (eval nil))
	
	((handle-match (car pattern) (car match)) 
	(match (cdr pattern) (cdr match))
	)
	
	((eql (car pattern) '!)
	(or (or (match (cdr pattern) (cdr match)) (match pattern (cdr match))) (match (cdr pattern) match))
	)
	
	((eql #\* (find #\* (string (car pattern))))
	    (if (eql t (handle-ast (coerce (string (car pattern)) 'list) (coerce (string (car match)) 'list)))
	        (match (cdr pattern) (cdr match))
	        (eval nil)
	        ))
	)
	
)

; Test Cases
; (print (match '(color apple red) '(color apple red)))
; (print (match '(color apple red) '(color apple green)))
; (print (match '(! table !) '(this table supports a block)))
; (print (match '(this table !) '(this table supports a block)))
; (print (match '(! brown) '(green red brown yellow)))
; (print (match '(! brown) '(green red brown brown)))
; (print (match '(red green ! blue) '(red green blue)))
; (print (match '(red gr*n blue) '(red green blue)))
; (print (match '(t* table is *n) '(this table is blue)))
; (print (match '(color apple *) '(color apple red)))
; (print (match '(color * red) '(color apple red)))
; (print (match '(color * red) '(color apple green)))
; (print (match '(color*red) '(color apple red)))
; (print (match '(color ! * red) '(color apple red)))
; (print (match '(color ! a**l* ! red) '(color loo apple red)))

