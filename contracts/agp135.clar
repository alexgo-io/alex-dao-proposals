(impl-trait .proposal-trait.proposal-trait)

(define-public (execute (sender principal))
	(begin
		(try! (contract-call? .token-susdt set-approved-contract .bridge-endpoint-v1-01 true))
		(ok true)	
	)
)
