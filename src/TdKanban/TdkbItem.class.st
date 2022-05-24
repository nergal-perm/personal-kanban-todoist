Class {
	#name : #TdkbItem,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #TdKanban
}

{ #category : #accessing }
TdkbItem >> gtTreeFor: aView [

	<gtView>
	^ aView columnedTree
		  title: 'Structure';
		  priority: 1;
		  items: [ self asArray ];
		  children: [ :item | item children ];
		  column: 'Title' text: [ :item | item name ];
		  column: 'Order' text: [ :item | item order ];
		  column: 'Type' text: [ :item | item asString ]
]

{ #category : #accessing }
TdkbItem >> id [

	^ rawData at: 'id'
]

{ #category : #accessing }
TdkbItem >> itemOrderSortedCollection [

	^ SortedCollection sortBlock: [ :x :y | x order < y order ]
]

{ #category : #accessing }
TdkbItem >> order [
	^ rawData at: 'order' ifAbsent: 0
]

{ #category : #accessing }
TdkbItem >> rawData: aDictionary [
	rawData := aDictionary
]
