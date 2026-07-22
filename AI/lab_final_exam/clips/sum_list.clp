

(deffunction sum-list (?lst)
   (bind ?sum 0)

   (foreach ?x ?lst
      (bind ?sum (+ ?sum ?x))
   )

   (return ?sum)
)



(deffunction search-element (?lst ?item)

   (bind ?index 0)

   (foreach ?x ?lst

      (if (eq ?x ?item) then
         (printout t crlf "TRUE - Element Found at Index: " ?index crlf)
         (return TRUE)
      )

      (bind ?index (+ ?index 1))
   )

   (printout t crlf "FALSE - Element Not Found." crlf)
   (return FALSE)
)



(deffunction start ()

   (printout t "Enter a list (e.g., 1 2 3 4): ")
   (bind ?lst (explode$ (readline)))

   (bind ?result (sum-list ?lst))

   (printout t crlf "Sum of the list = " ?result crlf)

   (printout t crlf "Enter element to search: ")
   (bind ?item (read))

   (search-element ?lst ?item)
)

