Class {
	#name : #JournalTransaction,
	#superclass : #Object,
	#instVars : [
		'date',
		'description',
		'entries',
		'posted'
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
JournalTransaction >> initialize [
	super initialize.
	self entries: LinkedList new.
]

{ #category : #'as yet unclassified' }
JournalTransaction >> isInBalance [
	^(self sumAmounts:self credits) = (self sumAmounts:self debits )
]

{ #category : #'as yet unclassified' }
JournalTransaction >> isPostable [
	self isPosted ifTrue: [^ false].
	date isNil ifTrue: [^ false].
	description isEmptyOrNil ifTrue: [^ false].
	entries isEmptyOrNil ifTrue: [^ false].
	^ self isInBalance.
]

{ #category : #'as yet unclassified' }
JournalTransaction >> isPosted [
	^ posted = true ifTrue: [true] ifFalse: [false]
]

{ #category : #'as yet unclassified' }
JournalTransaction >> postTo: aLedger [
	entries
		do: [ :entry | 
			(aLedger accounts at: entry account) entries
				add: (AccountEntry new
						amount: entry amount;
						entryType: entry entryType;
						date: date;
						description: description) ].
	posted := true
]

{ #category : #'as yet unclassified' }
JournalTransaction >> sumAmounts: aList [
	^ aList inject: 0 into: [ :sum :e | sum + e amount ]
]
