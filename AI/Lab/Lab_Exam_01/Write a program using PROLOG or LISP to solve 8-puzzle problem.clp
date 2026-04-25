# problem ache 

(deffunction goal-test (?state ?goal)
   (if (eq (str-cat ?state) (str-cat ?goal))
      then (return TRUE)
      else (return FALSE))
)

(deffunction main ()
   (printout t "Enter initial state (example: (1 2 3 4 0 5 6 7 8)): ")
   (bind ?init (read))

   (printout t "Enter goal state (example: (1 2 3 4 5 6 7 8 0)): ")
   (bind ?goal (read))

   (if (goal-test ?init ?goal)
      then
         (printout t crlf "Already in goal state!" crlf)
      else
         (printout t crlf "States are different." crlf))
)