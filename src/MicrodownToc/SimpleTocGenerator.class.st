Class {
	#name : 'SimpleTocGenerator',
	#superclass : 'MicrodownVisitor',
	#instVars : [
		'builder',
		'showOnlyAbove'
	],
	#category : 'MicrodownToc',
	#package : 'MicrodownToc'
}

{ #category : 'initialization' }
SimpleTocGenerator >> contents [
	^ builder contents.
]

{ #category : 'initialization' }
SimpleTocGenerator >> initialize [ 
super initialize.
builder := MicMicrodownTextualBuilder new.
showOnlyAbove := 0. 

]

{ #category : 'initialization' }
SimpleTocGenerator >> showOnlyAbove [
	^ showOnlyAbove
]

{ #category : 'initialization' }
SimpleTocGenerator >> showOnlyAbove: aLevel [
	showOnlyAbove := aLevel. 
]

{ #category : 'initialization' }
SimpleTocGenerator >> visit: aDocument [
	super visit: aDocument.
	^self

]

{ #category : 'initialization' }
SimpleTocGenerator >> visitHeader: aHeader [
	| hashtags |
	aHeader level >= showOnlyAbove
 	ifFalse: [ ^ self ].
	hashtags:= ''.
	1 to: aHeader level do: [ :i | hashtags:= hashtags , '#'].
	builder nextPutAll: (hashtags , ' ' , aHeader text , String cr).
	^ self

]
