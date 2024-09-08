Class {
	#name : #Money,
	#superclass : #Object,
	#instVars : [
		'amount',
		'currency'
	],
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
Money class >> amount: anAmount currency: aCurrency [
	^ Money new amount:anAmount; currency: aCurrency.
]

{ #category : #'as yet unclassified' }
Money >> = aMoney [
	^ amount = aMoney amount and: currency = aMoney currency
]

{ #category : #'as yet unclassified' }
Money >> amount [
	^ amount
]

{ #category : #'as yet unclassified' }
Money >> amount: anAmount [
	amount := anAmount
]

{ #category : #'as yet unclassified' }
Money >> currency [
	^ currency
]

{ #category : #'as yet unclassified' }
Money >> currency: aCurrency [
	currency := aCurrency
]

{ #category : #'as yet unclassified' }
Money >> equals: aMnoney [
	^ amount = aMnoney amount and: currency = aMnoney currency
]

{ #category : #'as yet unclassified' }
Money >> hash [
	^ 7
]
