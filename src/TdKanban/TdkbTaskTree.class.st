Class {
	#name : #TdkbTaskTree,
	#superclass : #TdkbItem,
	#instVars : [
		'rawData',
		'tasks'
	],
	#category : #'TdKanban-Examples'
}

{ #category : #accessing }
TdkbTaskTree >> asArray [
	tasks isNil
		ifTrue: [ tasks:= self asTree ].
		^ tasks
]

{ #category : #accessing }
TdkbTaskTree >> asTree [

	^ rawData collect: [ :task | TdkbTask new rawData: task ]
]

{ #category : #accessing }
TdkbTaskTree >> rawData: anArray [
	rawData:= anArray. 
]
