Class {
	#name : #MoneyBag,
	#superclass : #Money,
	#instVars : [
		'monies'
	],
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
MoneyBag >> + aMoney [
	"Add aMoney to the bag."
	aMoney currency isNil ifTrue: [aMoney monies do: [:m | monies add: m]] ifFalse: [monies add: aMoney]
]

{ #category : #'as yet unclassified' }
MoneyBag >> convert: aBank to: aCurrency [
	"Convert all monies summing their amounts."
	^ ConcreteMoney amount: ((monies collect: [:aMoney | aMoney convert: aBank to: aCurrency]) inject: 0 into: [:sum :m | sum + m amount]) currency: aCurrency
]

{ #category : #'as yet unclassified' }
MoneyBag >> monies [
	^ monies
]

{ #category : #'as yet unclassified' }
MoneyBag >> monies: anObject [
	monies := anObject
]
