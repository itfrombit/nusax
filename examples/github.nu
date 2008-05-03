(load "NuSAX")

(set path "http://github.com/api/v1/xml/deanmao/nusax/commits/master")

(puts "\n\nQUERY\n")
(puts path)

(set result (NSString stringWithShellCommand:(+ "curl -s \"" path "\"")))

(puts "\n\nRESULT\n")
(puts result)

(set parser ((NuSAX alloc) init))
(set info (parser parseXML:result parseError:nil))

(puts "\n\nPARSED\n")
(puts info)
