Class {
	#name : #JournalEntry,
	#superclass : #Entry,
	#instVars : [
		'account'
	],
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
JournalEntry >> account [
	^ account
]

{ #category : #'as yet unclassified' }
JournalEntry >> account: anAccount [
	account := anAccount
]
