Class {
	#name : 'TestGeneratesSimpleToc',
	#superclass : 'TestCase',
	#category : 'MicrodownToc-Tests',
	#package : 'MicrodownToc-Tests'
}

{ #category : 'tests' }
TestGeneratesSimpleToc >> testGeneratesExactSimpleToc [
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

	toc := SimpleMicrodownTocGenerator new.

	doc accept: toc.

	result := toc contents.

	expected := '# Microdown
# Architecture
## Pharo
## Université de Lille
'.

	self assert: result equals: expected.

]

{ #category : 'tests' }
TestGeneratesSimpleToc >> testGeneratesExactSimpleTocAccordingToLevel [
	| txt doc toc result expected |

	txt := '
# Microdown
Bonsoir
# Architecture
## Pharo
Hier
## Université de Lille
'.

	doc := Microdown parse: txt.

	toc := SimpleMicrodownTocGenerator new.
	toc showOnlyAbove: 2.

	doc accept: toc.

	result := toc contents.

	expected := '## Pharo
## Université de Lille
'.

	self assert: result equals: expected.

]
