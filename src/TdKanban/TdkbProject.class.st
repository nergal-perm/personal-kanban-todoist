Class {
	#name : #TdkbProject,
	#superclass : #TdkbItem,
	#instVars : [
		'rawData',
		'tasks',
		'comments'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdkbProject class >> withName: aString [ 

	^ TdkbProject new rawData: (Dictionary with: #name -> aString)
]

{ #category : #accessing }
TdkbProject class >> withTitle: aString [ 

	^ TdkbProject new rawData: (Dictionary with: #name -> aString)
]

{ #category : #accessing }
TdkbProject >> asTask [

	| taskData |
	taskData := Dictionary with: #content -> self name.
	^ TdkbTask new rawData: taskData
]

{ #category : #accessing }
TdkbProject >> children [
	^ self tasks
]

{ #category : #'as yet unclassified' }
TdkbProject >> description [
	^ rawData at: 'description'
]

{ #category : #accessing }
TdkbProject >> id [

	^ rawData at: 'id'
]

{ #category : #accessing }
TdkbProject >> isEmpty [

	^ self tasks isEmpty
]

{ #category : #accessing }
TdkbProject >> name [

	^ rawData at: 'name'
]

{ #category : #accessing }
TdkbProject >> rawData: aDictionary [

	rawData := aDictionary
]

{ #category : #accessing }
TdkbProject >> tasks [

	tasks ifNil: [ tasks := OrderedCollection new ].
	^ tasks
]
