Class {
	#name : #TdKanbanProjectCollection,
	#superclass : #Object,
	#instVars : [
		'items',
		'baseProjects'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdKanbanProjectCollection >> gtProjectsFor: aView [

	<gtView>
	^ aView columnedList
		title: 'Projects';
		priority: 10;
		items: [ items ];
		column: 'Id' 
			text: [ :eachItem | 
				eachItem id asRopedText foreground: Color gray ]
			width: 100;
		column: 'Title' 
			text: [ :eachItem | eachItem name gtDisplayText ].
	
]

{ #category : #accessing }
TdKanbanProjectCollection >> initialize [

	baseProjects := #( 'Current' 'Backlog' 'Inbox' )
]

{ #category : #accessing }
TdKanbanProjectCollection >> withProjects: ston [ 

items := (ston reject: [ :pr | baseProjects includes: (pr at: 'name') ]) 
		  collect: [ :pr | TdKanbanProject new rawData: pr ]
]
