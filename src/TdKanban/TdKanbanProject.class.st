Class {
	#name : #TdKanbanProject,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'tasks'
	],
	#category : #TdKanban
}

{ #category : #'as yet unclassified' }
TdKanbanProject >> description [
	^ rawData at: 'description'
]

{ #category : #accessing }
TdKanbanProject >> id [

	^ rawData at: 'id'
]

{ #category : #accessing }
TdKanbanProject >> isEmpty [

	^ self tasks isNil
		  ifTrue: [ ^ true ]
		  ifFalse: [ ^ self tasks isEmpty ]
]

{ #category : #accessing }
TdKanbanProject >> name [

	^ rawData at: 'name'
]

{ #category : #accessing }
TdKanbanProject >> rawData: aDictionary [

	rawData := aDictionary
]

{ #category : #accessing }
TdKanbanProject >> tasks [
	^ tasks
]
