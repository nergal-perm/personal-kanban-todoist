Class {
	#name : #TdkbTask,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #TdKanban
}

{ #category : #'as yet unclassified' }
TdkbTask >> isEmpty [
	^ true.
]

{ #category : #accessing }
TdkbTask >> name [
	^ rawData at: 'content'
]

{ #category : #accessing }
TdkbTask >> rawData: aDictionary [
	rawData := aDictionary 
]
