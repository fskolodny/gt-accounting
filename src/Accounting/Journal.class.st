Class {
	#name : #Journal,
	#superclass : #Object,
	#instVars : [
		'ledger',
		'transactions'
	],
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
Journal >> addTransaction [
	|transaction|
	transaction := JournalTransaction new.
	transactions add: transaction.
	^ transaction
]

{ #category : #'as yet unclassified' }
Journal >> initialize [
	super initialize.
	transactions := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Journal >> ledger [
	^ ledger
]

{ #category : #'as yet unclassified' }
Journal >> ledger: aLedger [
	ledger := aLedger
]

{ #category : #'as yet unclassified' }
Journal >> transactions [
	^ transactions
]
