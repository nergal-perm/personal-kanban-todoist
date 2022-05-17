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
TdkbConnection >> tasks [

	^ (STONJSON fromString: (connection
			   url: baseUrl , '/tasks';
			   get)) collect: [ :taskDict | TdkbTask new rawData: taskDict ]
]

{ #category : #accessing }
TdkbConnection >> withToken: aString [ 
    connection := ZnClient new headerAt: 'Authorization' put: 'Bearer ', aString
]
