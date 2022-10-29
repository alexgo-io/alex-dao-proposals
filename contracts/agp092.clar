(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 u100000000)
(define-constant seed-total (* u275707404 ONE_8))
(define-constant private-total (* u7629642 ONE_8))

(define-public (execute (sender principal))
    (begin
	    (try! (contract-call? .age000-governance-token mint-fixed (+ seed-total private-total) .executor-dao))
        
        (ok true)
    )
)
