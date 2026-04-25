(deffunction safe (?col ?dist $?queens)
   (if (eq $?queens (create$))
      then TRUE
      else
         (bind ?q (nth$ 1 $?queens))
         (if (or (= ?col ?q)
                 (= (abs (- ?col ?q)) ?dist))
            then FALSE
            else (safe ?col (+ ?dist 1) (rest$ $?queens)))
   )
)

(deffunction place (?k ?n $?queens)
   (if (= ?k 0)
      then
         (printout t "Solution: " $?queens crlf)
      else
         (loop-for-count (?i 1 ?n)
            (if (safe ?i 1 $?queens)
               then
                  (place (- ?k 1) ?n (create$ ?i $?queens))))
   )
)

(deffunction main ()
   (printout t "Enter value of N: ")
   (bind ?n (read))
   (printout t crlf "Solutions:" crlf)
   (place ?n ?n (create$))
)