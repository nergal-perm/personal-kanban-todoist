Class {
	#name : #TdKanbanConnection,
	#superclass : #Object,
	#instVars : [
		'baseUrl',
		'connection',
		'baseProjects'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdKanbanConnection >> initialize [
	baseUrl := 'https://api.todoist.com/rest/v1'.
	baseProjects := #('Current' 'Backlog' 'Inbox')
]

{ #category : #accessing }
TdKanbanConnection >> projects [

	| ston |
	ston := STONJSON fromString: (connection
			         url: baseUrl , '/projects';
			         get).
	^ (ston reject: [ :pr | baseProjects includes: (pr at: 'name') ]) 
		  collect: [ :pr | TdKanbanProject new rawData: pr ]
]

{ #category : #accessing }
TdKanbanConnection >> tasks [

	^ (STONJSON fromString: (connection
			   url: baseUrl , '/tasks';
			   get)) collect: [ :taskDict | TdKanbanTask new rawData: taskDict ]
]

{ #category : #accessing }
TdKanbanConnection >> withToken: aString [ 
    connection := ZnClient new headerAt: 'Authorization' put: 'Bearer ', aString
]
