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
Ledger >> initialize [
	super initialize.
	accounts := IdentityDictionary new.
]

{ #category : #'as yet unclassified' }
Ledger >> name: aString [
	name := aString.
]
