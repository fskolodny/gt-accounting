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
JournalTransaction >> sumAmounts: aList [
	^ aList inject: 0 into: [:sum :e | sum + e amount]

]
