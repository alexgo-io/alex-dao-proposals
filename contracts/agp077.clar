(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))
(define-constant lottery-0-burn u14966)
(define-constant lottery-1-burn u5508)
(define-constant lottery-2-burn u3116)
(define-constant lottery-3-burn u2670)

(define-public (execute (sender principal))
	(begin		
		(try! (contract-call? .age000-governance-token burn-fixed (* ONE_8 (+ lottery-0-burn lottery-1-burn lottery-2-burn lottery-3-burn)) tx-sender))
		(ok true)
	)
)
