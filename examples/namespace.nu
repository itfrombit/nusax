#!/usr/bin/env nush

(load "NuSAX")

(set parser ((NuSAX alloc) init))
(set x (parser parseXML:(NSString stringWithContentsOfFile:"namespace.xml")
               parseError:nil))

(puts "xml form:")
;(puts (x toXml))

(puts "list form:")
(puts x)

(if 0

(function symbolize (my-list)
     (set result
          (cond
               ((eq my-list nil) nil)
               (else
                    (cons (((my-list car) stringByReplacingOccurrencesOfString:":" withString:"=>") symbolValue)
                          (cons (((my-list) cdr) car)
                                (if ((((my-list cdr) cdr) car) isKindOfClass:NSString)
                                    then (cons (((my-list cdr) cdr) car) nil)
                                    else ((((my-list cdr) cdr) map:(do (x) (symbolize x))))))))))
     result)


(set s (symbolize x))

(puts "symbolized")
(puts s)


)



