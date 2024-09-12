Class {
	#name : #ConcreteMoney,
	#superclass : #Money,
	#instVars : [
		'amount',
		'currency'
	],
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
ConcreteMoney class >> amount: anAmount currency: aCurrency [
	^ ConcreteMoney new amount:anAmount; currency: aCurrency.
]

{ #category : #'as yet unclassified' }
ConcreteMoney >> + aMoney [
	currency = aMoney currency ifTrue: [^ ConcreteMoney amount: amount + aMoney amount currency: currency] ifFalse: [^ MoneyBag new monies: {self. aMoney}]
]

{ #category : #'as yet unclassified' }
ConcreteMoney >> = aMoney [
	^ amount = aMoney amount and: currency = aMoney currency
]

{ #category : #'as yet unclassified' }
ConcreteMoney >> addToBag: aBag [
	aBag add: self
]

{ #category : #'as yet unclassified' }
ConcreteMoney >> amount [
	^ amount
]

{ #category : #'as yet unclassified' }
ConcreteMoney >> amount: anAmount [
	amount := anAmount
]

{ #category : #'as yet unclassified' }
ConcreteMoney >> convert: aBank to: aCurrency [
	currency = aCurrency
		ifTrue: [ ^ self ]
		ifFalse: [ ^ ConcreteMoney
				amount: amount * (aBank findExchangeRateFrom: currency to: aCurrency)
				currency: aCurrency ]
]

{ #category : #'as yet unclassified' }
ConcreteMoney >> currency [
	^ currency
]

{ #category : #'as yet unclassified' }
ConcreteMoney >> currency: aCurrency [
	currency := aCurrency
]

{ #category : #'as yet unclassified' }
ConcreteMoney >> hash [
	^ 7
]
