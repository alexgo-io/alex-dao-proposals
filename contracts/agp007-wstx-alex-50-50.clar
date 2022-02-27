(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

;; wstx-alex-50-50 pool
(define-constant fifty-percent (/ ONE_8 u2))
(define-constant reduce-amount (/ (* ONE_8 u95) u100))

(define-public (execute (sender principal))
	(begin
		(try! (contract-call? .fixed-weight-pool reduce-position .token-wstx .age000-governance-token fifty-percent fifty-percent .fwp-wstx-alex-50-50 reduce-amount))
		(ok true)
	)
)