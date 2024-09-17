Class {
	#name : #AccountingExamples,
	#superclass : #Object,
	#category : #Accounting
}

{ #category : #accessing }
AccountingExamples >> currencies [
	<gtExample>
	| twoDollars bank thirtyFrancs fiveDollars fifteenDollars twentyDollars |
	bank := Bank new.
	twoDollars := ConcreteMoney amount: 2 currency: #USD.
	self assert: (bank reduce: twoDollars to: #USD) equals: twoDollars.
	bank
		addExchangeRateFrom: #USD
		to: #CHF
		rate: 2.
	thirtyFrancs := ConcreteMoney amount: 30 currency: #CHF.
	fifteenDollars := ConcreteMoney amount: 30 / 2 currency: #USD.
	self assert: (bank reduce: thirtyFrancs to: #USD) equals: fifteenDollars.
	self assert: (bank reduce: fifteenDollars to: #CHF) equals: thirtyFrancs.
	fiveDollars := ConcreteMoney amount: 5 currency: #USD.
	twentyDollars := ConcreteMoney amount: 20 currency: #USD.
	self
		assert: (bank reduce: thirtyFrancs + fiveDollars to: #USD)
		equals: twentyDollars.
	^ bank
]

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
	| transaction journal ledger cash capital actualBalance expectedBalance |
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
				account: cash name;
				amount: 300;
				entryType: #debit).
	transaction
		addEntry: (JournalEntry new
				account: capital name;
				amount: 300;
				entryType: #credit).
	self assert: transaction isPostable.
	transaction postTo: ledger.
	self assert: transaction isPosted.
	self assert: transaction isPostable not.
	actualBalance := (ledger accounts at: #Cash) balance.
	expectedBalance := Entry new
			amount: 300;
			entryType: #debit.
	self assert: actualBalance amount equals: expectedBalance amount.
	self assert: actualBalance entryType equals: expectedBalance entryType.
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
