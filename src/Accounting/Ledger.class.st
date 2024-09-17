Class {
	#name : #Ledger,
	#superclass : #Object,
	#instVars : [
		'name',
		'accounts'
	],
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
Ledger >> accounts [
	^ accounts
]

{ #category : #'as yet unclassified' }
Ledger >> accountsForDisplay [
	^ accounts values sort: [:account1 :account2| account1 number < account2 number]
]

{ #category : #'as yet unclassified' }
Ledger >> addAccountNamed: aName withNumber: aNumber [
	| account nameAsSymbol|
	nameAsSymbol := aName asSymbol.
	accounts keys
		detect: [ :key | key = nameAsSymbol ]
		ifNone: [ 
			account := Account new
				name: nameAsSymbol;
				number: aNumber.
			accounts add: account.
			^ account ]
]

{ #category : #'as yet unclassified' }
Ledger >> gtDetailFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details';
		priority: 100;
		items: [ self accountsForDisplay ];
		column: 'Number' text: [ :anAccount | anAccount number ];
		column: 'Name' text: [ :anAccount | anAccount name ];
		column: 'Debit' text: [ :anAccount | |balance| balance := anAccount balance. balance entryType = #debit ifTrue: [balance amount asScaledDecimal: 2] ifFalse: ['']];
		column: 'Credit' text: [ :anAccount | |balance| balance := anAccount balance. balance entryType = #credit ifTrue: [balance amount asScaledDecimal: 2] ifFalse: ['']]
]

{ #category : #'as yet unclassified' }
Ledger >> initialize [
	super initialize.
	accounts := IdentityDictionary new.
]

{ #category : #'as yet unclassified' }
Ledger >> name [
	^ name.
]

{ #category : #'as yet unclassified' }
Ledger >> name: aString [
	name := aString.
]
