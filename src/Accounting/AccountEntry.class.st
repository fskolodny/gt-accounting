Class {
	#name : #AccountEntry,
	#superclass : #Entry,
	#instVars : [
		'date',
		'description'
	],
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
AccountEntry >> date [
	^ date
]

{ #category : #'as yet unclassified' }
AccountEntry >> date: aDate [
	date := aDate
]

{ #category : #'as yet unclassified' }
AccountEntry >> description [
	^ description
]

{ #category : #'as yet unclassified' }
AccountEntry >> description: aString [
	description := aString
]
