Class {
	#name : #Bank,
	#superclass : #Object,
	#instVars : [
		'exchangeRates'
	],
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
Bank >> addExchangeRateFrom: fromCurrency to: toCurrency rate: aFraction [
	exchangeRates at: { fromCurrency. toCurrency} put: aFraction
]

{ #category : #'as yet unclassified' }
Bank >> findExchangeRateFrom: fromCurrency to: toCurrency [
	fromCurrency = toCurrency ifTrue: [ ^ 1 ].
	^ exchangeRates
		at: {fromCurrency.
				toCurrency}
		ifAbsent: [ 1
				/ (exchangeRates
						at: {toCurrency.
								fromCurrency}) ]
]

{ #category : #'as yet unclassified' }
Bank >> initialize [
	exchangeRates := Dictionary new.
]

{ #category : #'as yet unclassified' }
Bank >> reduce: aMoney to: aCurrency [
	^ aMoney convert: self to: aCurrency.
]
