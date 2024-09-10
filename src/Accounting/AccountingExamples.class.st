Class {
	#name : #AccountingExamples,
	#superclass : #Object,
	#category : #Accounting
}

{ #category : #'as yet unclassified' }
AccountingExamples >> emptyAccount [
	<gtExample>
	|ledger account|
	ledger := self emptyLedger.
	account := ledger addAccountNamed: 'Cash' withNumber: '101'.
	self assert: ledger accounts isEmpty not.
	^ account.
]

{ #category : #'as yet unclassified' }
AccountingExamples >> emptyJournal [
	<gtExample>
	|ledger journal|
	ledger := self emptyLedger.
	journal := Journal new ledger: ledger.
	self assert: journal transactions isEmpty.
	^ journal
]

{ #category : #'as yet unclassified' }
AccountingExamples >> emptyLedger [
	<gtExample>
	|ledger|
	ledger := Ledger new name: 'Test'.
	self assert: ledger accounts isEmpty.
	^ ledger
]

{ #category : #'as yet unclassified' }
AccountingExamples >> emptyTransaction [
	<gtExample>
	|transaction journal|
	journal := self emptyJournal.
	transaction := journal addTransaction.
	self assert: journal transactions isEmpty not.
	self assert: transaction isPostable not.
	^ transaction
]

{ #category : #accessing }
AccountingExamples >> journalEntryPosting [
	<gtExample>
	| transaction journal ledger cash capital |
	journal := self emptyJournal.
	transaction := journal addTransaction.
	transaction
		description: 'Initial investment';
		date: Date today.
	ledger := journal ledger.
	cash := ledger addAccountNamed: #Cash withNumber: #'101'.
	capital := ledger addAccountNamed: #Capital withNumber: '301'.
	transaction
		addEntry: (JournalEntry new
				account: cash;
				amount: 300;
				entryType: #debit).
	transaction
		addEntry: (JournalEntry new
				account: capital;
				amount: 300;
				entryType: #credit).
	self assert: transaction isPostable.
	transaction post.
	^ journal
]

{ #category : #accessing }
AccountingExamples >> noDuplicateAccounts [
	<gtExample>
	| ledger |
	ledger := self emptyLedger.
	ledger addAccountNamed: 'Cash' withNumber: '101'.
	self assert: ledger accounts size = 1.
	ledger addAccountNamed: 'Cash' withNumber: '102'.
	self assert: ledger accounts size = 1.
	self assert: (ledger accounts at: #Cash) number equals: '101'.
	^ ledger
]
