Class {
	#name : #Money,
	#superclass : #Object,
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
Money >> + aMoney [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Money >> addToBag: aBag [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Money >> convert: aBank to: aCurrency [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Money >> currency [
	"Non-concrete monies have no currency."
	^ nil
]
