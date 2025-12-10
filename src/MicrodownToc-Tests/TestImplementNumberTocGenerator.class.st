Class {
	#name : 'TestImplementNumberTocGenerator',
	#superclass : 'TestCase',
	#category : 'MicrodownToc-Tests',
	#package : 'MicrodownToc-Tests'
}

{ #category : 'tests' }
TestImplementNumberTocGenerator >> testGeneratesExactNumberTocAccordingToLevel [
    | txt doc toc result exemple |
    
    txt := '# Microdown
Bonjour 
# Values
## Pharo
## Université de Lille'.

    doc := Microdown parse: txt.

    toc := SimpleNumberTocGenerator new.
    toc showOnlyAbove: 2.

    doc accept: toc.

    result := toc contents.

    exemple := '3 Pharo
4 Université de Lille
'.

    self assert: result equals: exemple.

]

{ #category : 'tests' }
TestImplementNumberTocGenerator >> testGeneratesExactSimpleToc [
	| txt doc toc result expected |

	txt := '
# Microdown
Bonjour
# Architecture
Rien du tout
## Pharo
Peut-être
## Université de Lille
'.

	doc := Microdown parse: txt.

	toc := SimpleNumberTocGenerator new.

	doc accept: toc.

	result := toc contents.

	expected := '1 Microdown
2 Architecture
3 Pharo
4 Université de Lille
'.

	self assert: result equals: expected.

]
