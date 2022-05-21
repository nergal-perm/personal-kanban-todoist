Class {
	#name : #TdkbSection,
	#superclass : #TdkbItem,
	#instVars : [
		'rawData',
		'tasks'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdkbSection class >> withName: aString [
	^ self new rawData:(Dictionary with: #name -> aString).
	 
]

{ #category : #accessing }
TdkbSection >> asTask [

	| taskData |
	taskData := Dictionary with: #content -> self name.
	^ TdkbTask new
		  rawData: taskData;
		  withTasks: tasks;
		  yourself
]

{ #category : #accessing }
TdkbSection >> children [
	^ self tasks
]

{ #category : #accessing }
TdkbSection >> isEmpty [
	"Section is empty when it doesn't have tasks"
	^ self tasks isEmpty
]

{ #category : #accessing }
TdkbSection >> name [

	^ rawData at: #name
]

{ #category : #accessing }
TdkbSection >> rawData: aDictionary [
	rawData := aDictionary. 
]

{ #category : #accessing }
TdkbSection >> tasks [
	tasks ifNil: [ tasks:= OrderedCollection new].
	^ tasks
]

{ #category : #'as yet unclassified' }
TdkbSection >> withTasks: aCollection [ 
	tasks := aCollection.
]
