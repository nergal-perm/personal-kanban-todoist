Class {
	#name : #TdkbExamples,
	#superclass : #Object,
	#category : #'TdKanban-Examples'
}

{ #category : #accessing }
TdkbExamples >> descriptionComment [

	<gtExample>
	| comment |
	comment := TdkbComment new rawData:
		           (Dictionary with:
			            #content -> ('[DESC]', Character lf asString, 'Some description here.')).
	self assert: comment text equals: 'Some description here'.
	^ comment
]

{ #category : #accessing }
TdkbExamples >> emptyProject [

	"Empty project means a project with just a title"

	<gtExample>
	| emptyProject |
	emptyProject := TdkbProject withName: 'An empty project'.
	self assert: emptyProject isEmpty.
	^ emptyProject
]

{ #category : #accessing }
TdkbExamples >> emptyProjectConvertsToSimpleTask [

	<gtExample>
	| emptyTask |
	emptyTask := self emptyProject asTask.
	self assert: emptyTask name = 'An empty project'.
	^ emptyTask
]

{ #category : #accessing }
TdkbExamples >> emptySection [

	<gtExample>
	| emptySection |
	emptySection := TdkbSection withName: 'To do'.
	self assert: emptySection isEmpty.
	^ emptySection
]

{ #category : #accessing }
TdkbExamples >> emptySectionConvertsToSimpleTask [

	<gtExample>
	| emptyTask |
	emptyTask := self emptySection asTask.
	self assert: emptyTask name = 'To do'.
	^ emptyTask
]
