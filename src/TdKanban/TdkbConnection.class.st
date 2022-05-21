Class {
	#name : #TdkbConnection,
	#superclass : #Object,
	#instVars : [
		'baseUrl',
		'connection'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdkbConnection >> comments [

	^ STONJSON fromString: (connection
			   url: baseUrl , '/comments';
			   get)
]

{ #category : #accessing }
TdkbConnection >> commentsForProject: aProjectId [

	^ STONJSON fromString: (connection
			   url: baseUrl , '/comments';
			   queryAt: 'project_id' put: aProjectId;
			   get)
]

{ #category : #accessing }
TdkbConnection >> initialize [
	baseUrl := 'https://api.todoist.com/rest/v1'
]

{ #category : #accessing }
TdkbConnection >> items: itemType forProject: aProjectId [ 
	^ STONJSON fromString: (connection
		url: baseUrl, '/', itemType;
		queryAt: 'project_id' put: aProjectId;
		get)
]

{ #category : #accessing }
TdkbConnection >> project: projectId [

	| tasks sections | 
	tasks := self tasksForProject: projectId.
	sections := self sectionsForProject: projectId.

	^ TdkbProject new rawData:
		  (self projects select: [ :pr | (pr at: #id) = projectId ]) first
]

{ #category : #accessing }
TdkbConnection >> projects [
	^ STONJSON fromString: (connection
			         url: baseUrl , '/projects';
			         get).
]

{ #category : #accessing }
TdkbConnection >> sectionsForProject: aProjectId [

	| sectionsArray |
	sectionsArray := self items: 'sections' forProject: aProjectId.
	^ sectionsArray collect: [ :section | 
		  TdkbSection new rawData: section ]
]

{ #category : #accessing }
TdkbConnection >> tasks [

	^ (STONJSON fromString: (connection
			   url: baseUrl , '/tasks';
			   get)) collect: [ :taskDict | TdkbTask new rawData: taskDict ]
]

{ #category : #accessing }
TdkbConnection >> tasksForProject: aProjectId [
	| tasksArray |
	tasksArray := self items: 'tasks' forProject: aProjectId.
	^ tasksArray collect: [ :task | TdkbTask new rawData: task]
 
]

{ #category : #accessing }
TdkbConnection >> withToken: aString [ 
    connection := ZnClient new headerAt: 'Authorization' put: 'Bearer ', aString
]
