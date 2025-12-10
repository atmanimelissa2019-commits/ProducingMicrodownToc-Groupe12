Class {
	#name : 'MicrodownExerciseVisitor',
	#superclass : 'MicrodownVisitor',
	#instVars : [
		'builder',
		'solution',
		'chaptername'
	],
	#category : 'MicrodownToc',
	#package : 'MicrodownToc'
}

{ #category : 'initialization' }
MicrodownExerciseVisitor >> builder [
    ^ builder

]

{ #category : 'initialization' }
MicrodownExerciseVisitor >> chaptername [
    ^ chaptername
]

{ #category : 'initialization' }
MicrodownExerciseVisitor >> chaptername: aString [
    chaptername := aString
]

{ #category : 'initialization' }
MicrodownExerciseVisitor >> contents [
	^ builder contents

]

{ #category : 'initialization' }
MicrodownExerciseVisitor >> exportText: aString toFileNamed: aFileName [
    | file |
    file := FileLocator workingDirectory / aFileName.
    file writeStreamDo: [ :each |
        each nextPutAll: aString
    ].

]

{ #category : 'initialization' }
MicrodownExerciseVisitor >> initialize [
    super initialize.
    builder := MicMicrodownTextualBuilder new.
    solution := MicMicrodownTextualBuilder new.
    chaptername := 'UnknownChapter'.

]

{ #category : 'initialization' }
MicrodownExerciseVisitor >> solution [
    ^ solution
]

{ #category : 'initialization' }
MicrodownExerciseVisitor >> solutionContents [
    ^ solution contents

]

{ #category : 'initialization' }
MicrodownExerciseVisitor >> visit: aDocument [
	super visit: aDocument.
	^ self

]

{ #category : 'initialization' }
MicrodownExerciseVisitor >> visitCode: aBlock [
	| info anchor |

	info := aBlock mainExtensionTag.

	(info notNil and: [ info includesSubstring: 'exercise' ])
		ifFalse: [ ^ super visitCode: aBlock ].

	anchor := (info substrings: '=') last.
	builder nextPutAll: '```exercise', String cr.
	builder nextPutAll: aBlock code lines first, String cr.
	builder nextPutAll: 'Your code', String cr.
	builder nextPutAll: '```', String cr.
	solution nextPutAll:
		'Here is the solution of the code @', anchor,
		'@ in Chapter @', chaptername , '@', String cr.

	solution nextPutAll: '```', String cr.
	solution nextPutAll: aBlock code.
	solution nextPutAll: String cr, '```', String cr.
	

	^ self

]

{ #category : 'initialization' }
MicrodownExerciseVisitor >> visitHeader: aHeader [
	aHeader level = 1 ifTrue: [
		chaptername := aHeader text
	].
	^ super visitHeader: aHeader

]
