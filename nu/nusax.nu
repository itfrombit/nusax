;;   Licensed under the Apache License, Version 2.0 (the "License");
;;   you may not use this file except in compliance with the License.
;;   You may obtain a copy of the License at
;;
;;       http://www.apache.org/licenses/LICENSE-2.0
;;
;;   Unless required by applicable law or agreed to in writing, software
;;   distributed under the License is distributed on an "AS IS" BASIS,
;;   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;   See the License for the specific language governing permissions and
;;   limitations under the License.

(class NSString
  (- (id) stringByReplacingOccurrencesOfString:(id) old withString:(id) new is
     (set copy (NSMutableString stringWithString:self))
     (copy replaceOccurrencesOfString:old withString:new options:nil range:(list 0 (self length)))
     copy))

(class NSArray
  (imethod (id) join is
    ((self select:(do (x) x)) componentsJoinedByString:"")))

(class NSNull
  (imethod (id) toXml is
    (""))
  (imethod (id) xmlAttr is
    ("")))

(class NSObject
  (imethod (id) toXml is
    (self stringValue)))
    
(class NuSymbol
  (imethod (id) toXml is
    ((self stringValue) stringByReplacingOccurrencesOfString:":" withString:":")))

(class NuCell
  (imethod (id) join is
    ((NSArray arrayWithList:self) join))
   
  (imethod (id) xmlAttr is
    (" #{((first (first self)) toXml)}=\"#{(second (first self))}\"#{((rest self) xmlAttr)}"))
  
  (imethod (id) toXml is
    (if (== (self length) 2)
      (then "<#{((first self) toXml)}#{((second self) xmlAttr)}></#{((first self) toXml)}>")
      (else 
        (if (self 3)
          (then "<#{((first self) toXml)}#{((second self) xmlAttr)}>#{(((rest (rest self)) map: (do (i) (i toXml))) join)}</#{((first self) toXml)}>")
          (else "<#{((first self) toXml)}#{((second self) xmlAttr)}>#{((third self) toXml)}</#{((first self) toXml)}>"))))))

(class NSString
  (imethod (id) fromXml is
    (((NuSAX alloc) init) parseXML:self parseError:nil)))
