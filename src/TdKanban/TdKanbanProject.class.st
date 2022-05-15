Class {
	#name : #TdKanbanProject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdKanbanProject >> id [

	^ rawData at: 'id'
]

{ #category : #accessing }
TdKanbanProject >> name [

	^ rawData at: 'name'
]

{ #category : #accessing }
TdKanbanProject >> rawData: aDictionary [

	rawData := aDictionary
]
