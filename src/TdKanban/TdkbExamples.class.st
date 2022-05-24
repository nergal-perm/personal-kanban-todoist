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
TdkbExamples >> nestedTasksArray [

	<gtExample>
	<noTest>
	^ { 
		  (Dictionary newFrom: { 
				   ('id' -> 1).
				   ('content' -> 'Top Level').
				   ('order' -> 2) }).
		  (Dictionary newFrom: { 
				   ('id' -> 2).
				   ('parent_id' -> 1).
				   ('content' -> 'First subtask').
				   ('order' -> 2) }).
		  (Dictionary newFrom: { 
				   ('id' -> 3).
				   ('parent_id' -> 1).
				   ('content' -> 'Second subtask').
				   ('order' -> 1) }).
		  (Dictionary newFrom: { 
				   ('id' -> 4).
				   ('parent_id' -> 2).
				   ('content' -> 'Second level subtask') }).
		  (Dictionary newFrom: { 
				   ('id' -> 5).
				   ('content' -> 'Very important').
				   ('order' -> 1) }) }
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
TdkbExamples >> taskArrayConvertsToTaskTree [

	<gtExample>
	| taskTree |
	taskTree := TdkbTaskTree new rawData: self nestedTasksArray.
	^ taskTree asTree
]

{ #category : #accessing }
TdkbExamples >> todoSectionWithSingleTask [

	<gtExample>
	<noTest>
	| section |
	^ (self emptySection: 'To do') withTasks:
		  (OrderedCollection with: (self simpleTask: 'Task inside "To do" section'))
]
