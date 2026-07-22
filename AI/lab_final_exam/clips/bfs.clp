

(deffunction neighbors (?node)
   (if (eq ?node a) then (return (create$ b c)))
   (if (eq ?node b) then (return (create$ d e)))
   (if (eq ?node c) then (return (create$ f)))
   (if (eq ?node e) then (return (create$ g)))
   (if (eq ?node f) then (return (create$ g)))
   (return (create$))
)



(deffunction bfs (?start ?goal)

   (bind ?queue (create$ ?start))

   (while (> (length$ ?queue) 0) do

      (bind ?node (nth$ 1 ?queue))
      (bind ?queue (rest$ ?queue))

      (if (eq ?node ?goal) then
         (printout t crlf "Goal Found: " ?goal crlf)
         (return TRUE)
      )

      (bind ?adj (neighbors ?node))

      (foreach ?x ?adj
         (bind ?queue (create$ ?queue ?x))
      )
   )

   (printout t crlf "Goal Not Found." crlf)
)



(deffunction start ()

   (printout t "Enter Start Node: ")
   (bind ?s (read))

   (printout t "Enter Goal Node: ")
   (bind ?g (read))

   (bfs ?s ?g)
)