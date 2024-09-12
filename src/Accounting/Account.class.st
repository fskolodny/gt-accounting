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
