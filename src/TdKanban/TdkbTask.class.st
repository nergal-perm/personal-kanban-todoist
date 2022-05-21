Class {
	#name : #TdkbTask,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'tasks'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdkbTask >> gtSubtasksFor: aView [

	<gtView>
	^ aView columnedTree
		  title: 'Task Tree';
		  priority: 1;
		  items: [ self asArray ];
		  children: [ :item | item tasks ];
		  column: 'Title' text: [ :item | item name ]
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
