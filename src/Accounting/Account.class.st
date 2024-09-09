Class {
	#name : #Account,
	#superclass : #Object,
	#instVars : [
		'name',
		'number'
	],
	#category : #Accounting
}

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
