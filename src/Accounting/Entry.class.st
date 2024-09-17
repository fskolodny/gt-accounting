Class {
	#name : #Entry,
	#superclass : #Object,
	#instVars : [
		'amount',
		'entryType'
	],
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
Entry >> amount [
	^ amount
]

{ #category : #'as yet unclassified' }
Entry >> amount: aMoney [
	amount := aMoney
]

{ #category : #'as yet unclassified' }
Entry >> entryType [
	^ entryType
]

{ #category : #'as yet unclassified' }
Entry >> entryType: aSymbol [
	#(#debit #credit) detect: [:e | e = aSymbol] ifFound: [entryType := aSymbol]
]

{ #category : #'as yet unclassified' }
Entry >> equals: anEntry [
	^ (amount = anEntry amount) and: (entryType = anEntry entryType)
]
