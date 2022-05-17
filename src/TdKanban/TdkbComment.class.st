Class {
	#name : #TdkbComment,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'TdKanban-Examples'
}

{ #category : #accessing }
TdkbComment >> rawData: aDictionary [

	rawData := aDictionary. 
]

{ #category : #accessing }
TdkbComment >> text [
	^ rawData at: #content
]
