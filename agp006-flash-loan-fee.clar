(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant flash-loan-fee-rate (/ (* ONE_8 u3) u1000)) ;; 0.3% charged on flash-loan

(define-public (execute (sender principal))
	(contract-call? .alex-vault set-flash-loan-fee-rate flash-loan-fee-rate)
)
