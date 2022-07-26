(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))
(define-constant lottery-4-burn u2738)

(define-public (execute (sender principal))
	(begin		
		(try! (contract-call? .age000-governance-token burn-fixed (* ONE_8 lottery-4-burn) tx-sender))
		(try! (contract-call? .cofarm-apower-helper add-approved-contract 'SP1A6F9ABHQMVP92GH7T9ZBF029T1WG3SHPNMKT0D))
		(ok true)
	)
)
