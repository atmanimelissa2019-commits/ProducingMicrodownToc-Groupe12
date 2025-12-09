Class {
	#name : 'SimpleNumberTocGenerator',
	#superclass : 'SimpleTocGenerator',
	#instVars : [
		'number'
	],
	#category : 'MicrodownToc',
	#package : 'MicrodownToc'
}

{ #category : 'initialization' }
SimpleNumberTocGenerator >> initialize [ 
super initialize.
number:= 0. 
]

{ #category : 'accessing' }
SimpleNumberTocGenerator >> number [ 
^ number. 
]

{ #category : 'initialization' }
SimpleNumberTocGenerator >> visitHeader: aHeader [
	number:= number+1. 
	super visitHeader: aHeader prefix: number.
	^ self

]
