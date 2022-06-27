(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant crp-capacity-multiplier ONE_8)

(define-public (execute (sender principal))
	(begin		
        (try! (contract-call? .collateral-rebalancing-pool-v1 set-capacity-multiplier crp-capacity-multiplier))
		(ok true)
	)
)
