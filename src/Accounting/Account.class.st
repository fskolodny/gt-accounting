Class {
	#name : #Account,
	#superclass : #Object,
	#instVars : [
		'name',
		'number',
		'entries'
	],
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
Account >> balance [
	| debitBalance creditBalance |
	debitBalance := Entry new
			amount: 0;
			entryType: #debit.
	creditBalance := Entry new
			amount: 0;
			entryType: #credit.
	entries
		do: [ :entry | 
			entry entryType = #debit
				ifTrue: [ debitBalance amount: debitBalance amount + entry amount ]
				ifFalse: [ creditBalance amount: creditBalance amount + entry amount ] ].
	debitBalance amount < creditBalance amount ifTrue: [^ creditBalance amount: creditBalance amount - debitBalance amount; yourself] ifFalse: [^ debitBalance amount: debitBalance amount - creditBalance amount; yourself].
]

{ #category : #'as yet unclassified' }
Account >> entries [
	^ entries
]

{ #category : #'as yet unclassified' }
Account >> entries: aCollection [
	entries := aCollection
]

{ #category : #'as yet unclassified' }
Account >> initialize [
	super initialize.
	entries := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Account >> key [
	^ name asSymbol
]

{ #category : #'as yet unclassified' }
Account >> name [
	^ name
]

{ #category : #accessing }
Account >> name: aName [
	name := aName
]

{ #category : #'as yet unclassified' }
Account >> number [
	^ number
]

{ #category : #'as yet unclassified' }
Account >> number: aNumber [
	number := aNumber
]
