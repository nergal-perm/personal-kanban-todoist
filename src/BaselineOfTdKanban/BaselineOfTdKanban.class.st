Class {
	#name : #BaselineOfTdKanban,
	#superclass : #BaselineOf,
	#category : #BaselineOfTdKanban
}

{ #category : #baseline }
BaselineOfTdKanban >> baseline: spec [

	<baseline>
	spec for: #common do: [ spec package: 'TdKanban' ]
]
