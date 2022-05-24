Class {
	#name : #TdkbTask,
	#superclass : #TdkbItem,
	#instVars : [
		'tasks'
	],
	#category : #TdKanban
}

{ #category : #'as yet unclassified' }
TdkbTask >> addChild: aTdkbTask [

	self children add: aTdkbTask
]

{ #category : #'as yet unclassified' }
TdkbTask >> asTask [

	^ self
]

{ #category : #accessing }
TdkbTask >> children [

	^ self tasks
]

{ #category : #accessing }
TdkbTask >> hasNoParent [

	^ (rawData includesKey: 'parent_id') not
]

{ #category : #accessing }
TdkbTask >> isEmpty [

	^ self tasks isEmpty
]

{ #category : #accessing }
TdkbTask >> isInSection: sectionId [

	^ self sectionId = sectionId
]

{ #category : #accessing }
TdkbTask >> isNotEmpty [

	^ self tasks isEmpty not
]

{ #category : #accessing }
TdkbTask >> moveToParent: aDictionary [

	rawData
		at: 'parent_id'
		ifPresent: [ :parent | (aDictionary at: parent) addChild: self ]
]

{ #category : #accessing }
TdkbTask >> name [

	^ rawData at: 'content'
]

{ #category : #accessing }
TdkbTask >> sectionId [

	^ rawData at: #section_id
]

{ #category : #accessing }
TdkbTask >> tasks [

	tasks ifNil: [ tasks := self itemOrderSortedCollection ].
	^ tasks
]

{ #category : #accessing }
TdkbTask >> withTasks: aCollection [

	tasks := aCollection
]
