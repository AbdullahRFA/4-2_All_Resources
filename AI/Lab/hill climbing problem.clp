; ==============================
; Heuristic values
; ==============================
(deffacts heuristics
   (value A 3)
   (value B 5)
   (value C 4)
   (value D 7)
   (value E 6)
   (value F 2)
)

; ==============================
; Graph edges
; ==============================
(deffacts graph
   (edge A B)
   (edge A C)
   (edge B D)
   (edge B E)
   (edge C F)
)

; ==============================
; Start node
; ==============================
(deffacts start
   (current A)
)

; ==============================
; Display current node
; ==============================
(defrule show-current
   (current ?node)
   (value ?node ?v)
   =>
   (printout t "Current Node: " ?node
               "  Value: " ?v crlf)
)

; ==============================
; Move to better neighbor
; ==============================
(defrule move-to-better
   ?c <- (current ?node)
   (value ?node ?v1)

   (edge ?node ?next)
   (value ?next ?v2)

   (test (> ?v2 ?v1))
   =>
   (retract ?c)
   (assert (current ?next))
)

; ==============================
; Stop when no better neighbor
; ==============================
(defrule stop
   (current ?node)
   (value ?node ?v)
   (not (and
          (edge ?node ?n)
          (value ?n ?v2)
          (test (> ?v2 ?v))))
   =>
   (printout t crlf
      "Reached Local Maximum at "
      ?node " with value " ?v crlf)
)