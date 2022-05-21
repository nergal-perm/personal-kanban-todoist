Class {
	#name : #TdkbItem,
	#superclass : #Object,
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
		  column: 'Type' text: [ :item | item asString ]
]
