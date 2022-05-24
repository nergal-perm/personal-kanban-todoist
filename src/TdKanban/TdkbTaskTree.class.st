Class {
	#name : #TdkbTaskTree,
	#superclass : #TdkbItem,
	#instVars : [
		'tasks'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdkbTaskTree >> asArray [

	tasks ifNil: [ tasks := self asTree ].
	^ tasks
]

{ #category : #accessing }
TdkbTaskTree >> asTree [

	| keys values tree |
	keys := rawData collect: [ :task | task at: #id ].
	values := rawData collect: [ :task | TdkbTask new rawData: task ].

	tree := Dictionary newFromKeys: keys andValues: values.

	values do: [ :task | task moveToParent: tree ].

	^ tree values select: [ :task | task hasNoParent ]
]
