Class {
	#name : #TdkbTask,
	#superclass : #TdkbItem,
	#instVars : [
		'rawData',
		'tasks'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdkbTask >> children [
	^ self tasks
]

{ #category : #accessing }
TdkbTask >> isEmpty [
	^ self tasks isEmpty
]

{ #category : #accessing }
TdkbTask >> isNotEmpty [
	^ self tasks isEmpty not
]

{ #category : #accessing }
TdkbTask >> name [
	^ rawData at: 'content'
]

{ #category : #accessing }
TdkbTask >> rawData: aDictionary [
	rawData := aDictionary 
]

{ #category : #accessing }
TdkbTask >> tasks [
	"This is a new method"
	tasks ifNil: [tasks := OrderedCollection new].
	^ tasks
]

{ #category : #accessing }
TdkbTask >> withTasks: aCollection [
	tasks := aCollection.
]
