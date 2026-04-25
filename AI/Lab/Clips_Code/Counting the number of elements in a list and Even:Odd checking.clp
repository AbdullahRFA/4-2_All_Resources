; --------- Define a fact containing the list ----------
(deffacts number-list
   (numbers 1 2 3 4 5 6 7 8 9 10)
)

; --------- Rule to process the list ----------
(defrule count-and-check
   (numbers $?list)
   =>
   ; Count elements
   (bind ?count (length$ ?list))

   (printout t "Total elements in the list: " ?count crlf crlf)

   ; Check Even/Odd
   (foreach ?n ?list
      (if (eq (mod ?n 2) 0)
         then
            (printout t ?n " is EVEN" crlf)
         else
            (printout t ?n " is ODD" crlf)
      )
   )
)