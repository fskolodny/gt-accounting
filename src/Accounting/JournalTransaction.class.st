Class {
	#name : #JournalTransaction,
	#superclass : #Object,
	#instVars : [
		'date',
		'description',
		'entries'
	],
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
JournalTransaction >> addEntry: anEntry [
	entries add: anEntry
]

{ #category : #'as yet unclassified' }
JournalTransaction >> credits [
	^ entries select: [:e | e entryType = #credit]
]

{ #category : #'as yet unclassified' }
JournalTransaction >> date [
	^ date
]

{ #category : #'as yet unclassified' }
JournalTransaction >> date: aDate [
	date := aDate
]

{ #category : #'as yet unclassified' }
JournalTransaction >> debits [
	^ entries select: [:e | e entryType = #debit]
]

{ #category : #'as yet unclassified' }
JournalTransaction >> description [
	^ description
]

{ #category : #'as yet unclassified' }
JournalTransaction >> description: aString [
	description := aString
]

{ #category : #'as yet unclassified' }
JournalTransaction >> entries [
	^ entries
]

{ #category : #'as yet unclassified' }
JournalTransaction >> entries: aList [
	entries := aList
]

{ #category : #'as yet unclassified' }
JournalTransaction >> gtTransactionView: aView [
	<gtView>
	^ aView columnedTree
		title: 'Formatted';
		priority: 100;
		items: [ | variableNodes |
			variableNodes := OrderedCollection new: self class allSlots size.
			variableNodes add: (GtInspectorSelfNode hostObject: self).
			self gtInspectorVariableNodesIn: variableNodes.
			variableNodes ];
		children: [ :aNode | aNode childrenNodes ];
		column: 'Variable'
			do: [ :aColumn | 
				aColumn
					cellStencil: [ BrHorizontalPane new
							hMatchParent;
							vFitContent;
							alignCenter ];
					dataBinder: [ :itemElement :aNode | 
						| nodeIcon |
						nodeIcon := [ aNode rawValue gtInspectorIcon
								ifNil: [ aNode rawValue class iconNamed: aNode rawValue class systemIconName ] ]
								on: Error
								do: [ :error | Smalltalk ui icons iconNamed: #smallWarningIcon ].

						itemElement
							removeChildren;
							addChild: nodeIcon asElement;
							addChild: (BrLabel new
									aptitude: BrGlamorousListLabelAptitude;
									text: aNode label;
									alignCenterLeft;
									hMatchParent;
									vFitContent) ] ];
		column: 'Value'
			text: [ :aNode | 
				[ aNode rawValue gtDisplayText ]
					on: Error , Halt
					do: [ aNode errorMessage asRopedText foreground: Color red ] ];
		send: #value;
		actionUpdateButton
]

{ #category : #'as yet unclassified' }
JournalTransaction >> initialize [
	self entries: LinkedList new.
]

{ #category : #'as yet unclassified' }
JournalTransaction >> isInBalance [
	^(self sumAmounts:self credits) = (self sumAmounts:self debits )
]

{ #category : #'as yet unclassified' }
JournalTransaction >> isPostable [
	date isNil ifTrue: [^ false].
	description isEmptyOrNil ifTrue: [^ false].
	entries isEmptyOrNil ifTrue: [^ false].
	^ self isInBalance.
]

{ #category : #'as yet unclassified' }
JournalTransaction >> post [
	entries
		do: [ :entry | 
			entry account entries
				add: (AccountEntry new
						amount: entry amount;
						entryType: entry entryType;
						date: date;
						description: description) ]
]

{ #category : #'as yet unclassified' }
JournalTransaction >> sumAmounts: aList [
	^ aList inject: 0 into: [ :sum :e | sum + e amount ]
]
