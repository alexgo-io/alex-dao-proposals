(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))
(define-constant oracle-average (/ (* ONE_8 u99) u100)) ;; resilient oracle follows (0.05 * now + 0.99 * resilient-oracle-before)

(define-public (execute (sender principal))
	(begin
		(try! (contract-call? .simple-weight-pool-alex set-oracle-average .age000-governance-token .auto-alex oracle-average))
		(try! (contract-call? .alex-vault add-approved-contract .margin-helper))
		(ok true)	
	)
)
