#!/usr/bin/env nush

(load "NuSAX")

(set parser ((NuSAX alloc) init))
(set x (parser parseXML:(NSString stringWithContentsOfFile:"namespace.xml")
               parseError:nil))

(puts "xml form:")
(puts (x toXml))

(puts "list form:")
(puts x)
