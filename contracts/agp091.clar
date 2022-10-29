(impl-trait .proposal-trait.proposal-trait)

(define-public (execute (sender principal))
    (let 
        (
            (id (try! (contract-call? .age009-token-lock set-recipient 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK "test user")))
        )
	    (try! (contract-call? .executor-dao set-extension .age009-token-lock true))
        
        ;; for testing only        
        (try! (contract-call? .age009-token-lock set-vesting-schedule id u1 u0 u1000000000000))        
        (ok true)
    )
)
