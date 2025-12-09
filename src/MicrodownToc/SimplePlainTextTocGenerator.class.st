Class {
	#name : 'SimplePlainTextTocGenerator',
	#superclass : 'SimpleTocGenerator',
	#category : 'MicrodownToc',
	#package : 'MicrodownToc'
}

{ #category : 'visiting' }
SimplePlainTextTocGenerator >> visitHeader: aHeader [
 |level|
 level := ''.
1 to: aHeader level do: [ :i | level:= level , ' '].
super visitHeader: aHeader prefix: level.
^ self. 
]
