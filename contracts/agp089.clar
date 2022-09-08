(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant max-in-ratio (/ (* ONE_8 u10) u100))
(define-constant max-out-ratio (/ (* ONE_8 u10) u100))

(define-public (execute (sender principal))
	(begin		
		(try! (contract-call? .weighted-equation-v1-01 set-max-in-ratio max-in-ratio))
        (try! (contract-call? .weighted-equation-v1-01 set-max-out-ratio max-out-ratio))
		(try! (contract-call? .simple-equation set-max-in-ratio max-in-ratio))
        (try! (contract-call? .simple-equation set-max-out-ratio max-out-ratio))		
		(ok true)
	)
)
