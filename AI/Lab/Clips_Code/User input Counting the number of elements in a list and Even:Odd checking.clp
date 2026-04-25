; --------- Rule to take input from user ----------
(defrule input-list
   =>
   (printout t "Enter numbers separated by space (end with Enter): " crlf)
   (bind ?list (readline))

   ; Convert string input into a multifield list
   (bind ?numbers (explode$ ?list))

   ; Assert the list as fact
   (assert (numbers ?numbers))
)

; --------- Rule to count and check ----------
(defrule count-and-check
   (numbers $?list)
   =>
   ; Count elements
   (bind ?count (length$ ?list))

   (printout t crlf "Total elements in the list: " ?count crlf crlf)

   ; Check Even/Odd
   (foreach ?n ?list
      (bind ?num (integer ?n))   ; Convert string to number

      (if (eq (mod ?num 2) 0)
         then
            (printout t ?num " is EVEN" crlf)
         else
            (printout t ?num " is ODD" crlf)
      )
   )
)