(deffunction hanoi (?n ?source ?target ?aux)
   (if (= ?n 1)
      then
         (printout t "Move disk from " ?source " to " ?target crlf)
      else
         (hanoi (- ?n 1) ?source ?aux ?target)
         (hanoi 1 ?source ?target ?aux)
         (hanoi (- ?n 1) ?aux ?target ?source)
   )
)

(deffunction main ()
   (printout t "Enter number of disks: ")
   (bind ?n (read))
   (printout t crlf "Moves are:" crlf)
   (hanoi ?n A C B)
)