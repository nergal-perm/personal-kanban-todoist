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
TdkbConnection >> projects [

	| ston |
	ston := STONJSON fromString: (connection
			         url: baseUrl , '/projects';
			         get).
	^ TdkbProjectCollection new withProjects: ston
]

{ #category : #accessing }
TdkbConnection >> sectionsForProject: aProjectId [
	^ STONJSON fromString: (connection
		url: baseUrl, '/sections';
		queryAt: 'project_id' put: aProjectId;
		get) 
]

{ #category : #accessing }
TdkbConnection >> tasks [

	^ (STONJSON fromString: (connection
			   url: baseUrl , '/tasks';
			   get)) collect: [ :taskDict | TdkbTask new rawData: taskDict ]
]

{ #category : #accessing }
TdkbConnection >> withToken: aString [ 
    connection := ZnClient new headerAt: 'Authorization' put: 'Bearer ', aString
]
