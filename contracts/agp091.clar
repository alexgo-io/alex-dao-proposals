(impl-trait .proposal-trait.proposal-trait)

(define-public (execute (sender principal))
    (begin
	    (try! (contract-call? .executor-dao set-extension .age009-token-lock true))
        (contract-call? .age009-token-lock set-vesting-schedule 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK u1 u0 u1000000000000)
    )
)
