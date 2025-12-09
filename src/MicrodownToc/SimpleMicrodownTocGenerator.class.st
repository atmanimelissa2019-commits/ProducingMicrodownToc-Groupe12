Class {
	#name : 'SimpleMicrodownTocGenerator',
	#superclass : 'SimpleTocGenerator',
	#category : 'MicrodownToc',
	#package : 'MicrodownToc'
}

{ #category : 'visiting' }
SimpleMicrodownTocGenerator >> visitHeader: aHeader [
	| hashtags |
	hashtags:= ''.
	1 to: aHeader level do: [ :i | hashtags:= hashtags , '#'].
	super visitHeader: aHeader prefix: hashtags. 
	^ self

]
