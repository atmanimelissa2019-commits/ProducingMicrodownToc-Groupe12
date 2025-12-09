Class {
	#name : 'SimpleTocGenerator',
	#superclass : 'MicrodownVisitor',
	#instVars : [
		'builder',
		'showOnlyAbove',
		'counter',
		'numbered'
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

{ #category : 'instance creation' }
SimpleTocGenerator >> new [
    self error: 'Abstract class - cannot be instantiated'

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

{ #category : 'visiting' }
SimpleTocGenerator >> visitHeader: aHeader [
	^ self

]

{ #category : 'initialization' }
SimpleTocGenerator >> visitHeader: aHeader prefix: aPrefix [
	aHeader level >= showOnlyAbove
 	ifFalse: [ ^ self ].
	builder nextPutAll: (aPrefix asString , ' ' , aHeader text , String cr).
	^ self

]
