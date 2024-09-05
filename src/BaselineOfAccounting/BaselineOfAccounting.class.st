Class {
	#name : #BaselineOfAccounting,
	#superclass : #BaselineOf,
	#category : #BaselineOfAccounting
}

{ #category : #loading }
BaselineOfAccounting class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt-accounting' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfAccounting >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Accounting'
		]
]
