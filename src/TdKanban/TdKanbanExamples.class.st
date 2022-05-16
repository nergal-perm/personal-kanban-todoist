Class {
	#name : #TdKanbanExamples,
	#superclass : #Object,
	#category : #'TdKanban-Examples'
}

{ #category : #accessing }
TdKanbanExamples >> emptyProject [

	"Empty project means a project with no tasks and no description comments"

	<gtExample>
	| emptyProject |
	emptyProject := TdKanbanProject new.
	self assert: emptyProject isEmpty.
	^ emptyProject
]
