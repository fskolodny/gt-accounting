Class {
	#name : #AccountingExamples,
	#superclass : #Object,
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
AccountingExamples >> emptyJournal [
|ledger journal|
<gtExample>
ledger := self emptyLedger.
journal := Journal new ledger: ledger.
^ journal
]

{ #category : #'as yet unclassified' }
AccountingExamples >> emptyLedger [
|ledger|
<gtExample>
ledger := Ledger new.
^ ledger
]
