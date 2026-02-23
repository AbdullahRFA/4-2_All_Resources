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
   (stack A)
)

; ==============================
; Visit node (DFS)
; ==============================
(defrule visit-node
   ?s <- (stack ?node)
   (not (visited ?node))
   =>
   (retract ?s)

   (printout t "Visited: " ?node crlf)

   (assert (visited ?node))
)

; ==============================
; Push neighbors onto stack
; ==============================
(defrule push-neighbor
   (visited ?node)
   (edge ?node ?neighbor)
   (not (visited ?neighbor))
   =>
   (assert (stack ?neighbor))
)

; ==============================
; Remove visited nodes from stack
; ==============================
(defrule remove-visited
   ?s <- (stack ?node)
   (visited ?node)
   =>
   (retract ?s)
)