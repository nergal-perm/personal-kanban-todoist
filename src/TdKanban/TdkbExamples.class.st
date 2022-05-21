Class {
	#name : #TdkbExamples,
	#superclass : #Object,
	#category : #'TdKanban-Examples'
}

{ #category : #accessing }
TdkbExamples >> aProjectWithSectionAndTask [

	<gtExample>
	<noTest>
	^ self emptyProject
		  addSections: { self todoSectionWithSingleTask };
		  addTasks: { (self simpleTask: 'Task outside of a section') };
		  yourself
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
TdkbExamples >> emptySection: aSectionTitle [

	<gtExample>
	| emptySection |
	emptySection := TdkbSection withName: aSectionTitle.
	self assert: emptySection isEmpty.
	^ emptySection
]

{ #category : #accessing }
TdkbExamples >> emptySectionConvertsToSimpleTask [

	<gtExample>
	| emptyTask |
	emptyTask := (self emptySection: 'To do') asTask.
	self assert: emptyTask name = 'To do'.
	^ emptyTask
]

{ #category : #accessing }
TdkbExamples >> sectionWithTaskConvertsToTaskTree [

	<gtExample>
	| taskTree |
	taskTree := self todoSectionWithSingleTask asTask.
	self assert: taskTree isNotEmpty.
	^ taskTree
]

{ #category : #accessing }
TdkbExamples >> simpleProjectConvertsToTask [

	<gtExample>
	| taskTree |
	taskTree := self aProjectWithSectionAndTask asTask.
	self assert: taskTree isNotEmpty.
	^ taskTree
]

{ #category : #accessing }
TdkbExamples >> simpleTask: aTaskTitle [

	<gtExample>
	<noTest>
	^ TdkbTask new rawData:
		  (Dictionary with: #content -> aTaskTitle)
]

{ #category : #accessing }
TdkbExamples >> todoSectionWithSingleTask [

	<gtExample>
	<noTest>
	| section |
	^ (self emptySection: 'To do') withTasks:
		  (OrderedCollection with: (self simpleTask: 'Task inside "To do" section'))
]
