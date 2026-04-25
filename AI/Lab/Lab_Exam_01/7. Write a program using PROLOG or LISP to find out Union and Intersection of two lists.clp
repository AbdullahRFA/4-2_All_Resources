# problem ache

(deffunction member-check (?x $?lst)
   (if (eq $?lst (create$))
      then FALSE
      else
         (if (= ?x (nth$ 1 $?lst))
            then TRUE
            else (member-check ?x (rest$ $?lst)))
   )
)

(deffunction intersection-list ($?l1 $?l2)
   (if (eq $?l1 (create$))
      then (create$)
      else
         (bind ?x (nth$ 1 $?l1))
         (if (member-check ?x $?l2)
            then (create$ ?x (intersection-list (rest$ $?l1) $?l2))
            else (intersection-list (rest$ $?l1) $?l2))
   )
)

(deffunction union-list ($?l1 $?l2)
   (if (eq $?l2 (create$))
      then $?l1
      else
         (bind ?x (nth$ 1 $?l2))
         (if (member-check ?x $?l1)
            then (union-list $?l1 (rest$ $?l2))
            else (union-list (create$ $?l1 ?x) (rest$ $?l2)))
   )
)

(deffunction main ()
   (printout t "Enter first list (use create$: e.g. (create$ 1 2 3)): ")
   (bind $?l1 (eval (read)))

   (printout t "Enter second list (use create$: e.g. (create$ 3 4 5)): ")
   (bind $?l2 (eval (read)))

   (bind $?i (intersection-list $?l1 $?l2))
   (bind $?u (union-list $?l1 $?l2))

   (printout t crlf "Intersection: " $?i crlf)
   (printout t "Union: " $?u crlf)
)