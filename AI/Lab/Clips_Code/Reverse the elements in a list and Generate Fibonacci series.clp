; ==============================
; Rule 1: Take list input
; ==============================
(defrule input-list
   (declare (salience 10))
   =>
   (printout t "Enter numbers for list (space separated): " crlf)
   (bind ?line (readline))
   (bind ?list (explode$ ?line))
   (assert (numbers ?list))
)

; ==============================
; Rule 2: Reverse the list (NO loop-for-count)
; ==============================
(defrule reverse-list
   (numbers $?list)
   =>
   (bind ?rev (create$))
   (bind ?i (length$ ?list))

   (while (> ?i 0)
      (bind ?rev
            (insert$ ?rev
                     (+ (length$ ?rev) 1)
                     (nth$ ?i ?list)))
      (bind ?i (- ?i 1))
   )

   (printout t crlf "Reversed list: " ?rev crlf)

   ; Ask Fibonacci input
   (printout t crlf "Enter number of terms for Fibonacci series: ")
   (bind ?n (read))
   (assert (fibo-count ?n))
)

; ==============================
; Rule 3: Fibonacci Series
; ==============================
(defrule fibonacci-series
   (fibo-count ?n)
   =>
   (bind ?a 0)
   (bind ?b 1)
   (bind ?i 1)

   (printout t crlf "Fibonacci Series: ")

   (while (<= ?i ?n)
      (printout t ?a " ")
      (bind ?temp (+ ?a ?b))
      (bind ?a ?b)
      (bind ?b ?temp)
      (bind ?i (+ ?i 1))
   )

   (printout t crlf)
)