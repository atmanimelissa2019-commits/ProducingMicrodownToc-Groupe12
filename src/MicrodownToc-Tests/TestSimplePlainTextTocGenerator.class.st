Class {
	#name : 'TestSimplePlainTextTocGenerator',
	#superclass : 'TestCase',
	#category : 'MicrodownToc-Tests',
	#package : 'MicrodownToc-Tests'
}

{ #category : 'tests' }
TestSimplePlainTextTocGenerator >> testGeneratesExactSimplePlainTocAccordingToLevel [
	| txt doc toc result expected |

	txt := '
#Microdown
Bonsoir
#Architecture
##Pharo
Hier
##Université de Lille
'.

	doc := Microdown parse: txt.

	toc := SimplePlainTextTocGenerator new.
	toc showOnlyAbove: 2.

	doc accept: toc.

	result := toc contents.

	expected := '   Pharo
   Université de Lille
'.

	self assert: result equals: expected.

]

{ #category : 'tests' }
TestSimplePlainTextTocGenerator >> testSimplePlainTextGenerator [
	| txt doc toc result expected |

	txt := '
#Microdown
Bonjour
#Architecture
Rien du tout
##Pharo
Peut-être
##Université de Lille
'.

	doc := Microdown parse: txt.

	toc := SimplePlainTextTocGenerator new.

	doc accept: toc.

	result := toc contents.

	expected := '  Microdown
  Architecture
   Pharo
   Université de Lille
'.

	self assert: result equals: expected.

]
