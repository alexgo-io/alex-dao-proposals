(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))
(define-constant amount u222200)

(define-public (execute (sender principal))
	(begin
		(try! (contract-call? .age000-governance-token burn-fixed (* amount ONE_8) .event-claim-helper))
		(try! (contract-call? .age000-governance-token mint-fixed (* amount ONE_8) 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9))
		(ok true)	
	)
)

