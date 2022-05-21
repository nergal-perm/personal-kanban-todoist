Class {
	#name : #TdkbProject,
	#superclass : #TdkbItem,
	#instVars : [
		'rawData',
		'tasks',
		'comments',
		'sections'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdkbProject class >> withName: aString [ 

	^ TdkbProject new rawData: (Dictionary with: #name -> aString)
]

{ #category : #'as yet unclassified' }
TdkbProject >> addSections: aCollection [ 
	self sections addAll: aCollection.
]

{ #category : #'as yet unclassified' }
TdkbProject >> addTasks: aCollection [ 
	self tasks addAll: aCollection.
]

{ #category : #accessing }
TdkbProject >> asTask [

	| taskData |
	taskData := Dictionary with: #content -> self name.
	^ TdkbTask new 
		rawData: taskData;
		withTasks: (self children collect: [ :child | child asTask]);
		yourself
]

{ #category : #accessing }
TdkbProject >> children [
	^ self sections, self tasks
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
TdkbProject >> sections [
	sections ifNil: [ sections := OrderedCollection new ].
	^ sections
]

{ #category : #accessing }
TdkbProject >> tasks [

	tasks ifNil: [ tasks := OrderedCollection new ].
	^ tasks
]
