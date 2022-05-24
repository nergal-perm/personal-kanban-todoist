Class {
	#name : #TdkbProjectCollection,
	#superclass : #Object,
	#instVars : [
		'items',
		'baseProjects'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdkbProjectCollection >> gtProjectsFor: aView [

	<gtView>
	^ aView columnedList
		  title: 'Projects';
		  priority: 10;
		  items: [ items ];
		  column: 'Id'
		  text: [ :eachItem | 
			  eachItem id asRopedText foreground: Color gray ]
		  width: 100;
		  column: 'Title' text: [ :eachItem | eachItem name gtDisplayText ]
]

{ #category : #accessing }
TdkbProjectCollection >> initialize [

	baseProjects := #( 'Current' 'Backlog' 'Inbox' )
]

{ #category : #accessing }
TdkbProjectCollection >> withProjects: ston [

	items := (ston reject: [ :pr | 
		          baseProjects includes: (pr at: 'name') ]) collect: [ :pr | 
		         TdkbProject new rawData: pr ]
]
