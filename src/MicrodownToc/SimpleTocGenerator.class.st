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
SimpleTocGenerator >> initialize [ 
super initialize .
showOnlyAbove := 1.
]
