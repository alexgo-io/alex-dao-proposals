(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-public (execute (sender principal))
	(begin		
        (try! (contract-call? .alex-lottery add-approved-operator 'SP1A6F9ABHQMVP92GH7T9ZBF029T1WG3SHPNMKT0D))
		(try! (contract-call? .token-apower add-approved-contract .alex-lottery))
		(try! (contract-call? .age000-governance-token edg-add-approved-contract .alex-lottery))
		(ok true)
	)
)
