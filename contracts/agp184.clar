(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant amount-btc (* u253 ONE_8))
(define-constant amount-alex (* u554 ONE_8))

(define-public (execute (sender principal))
	(begin
		(try! (contract-call? .alex-vault add-approved-token .vault-welsh-pool))
    	(try! (contract-call? .alex-reserve-pool add-token .vault-welsh-pool))
		(try! (contract-call? .alex-reserve-pool set-activation-block .vault-welsh-pool u46601))	
		(try! (contract-call? .alex-reserve-pool set-apower-multiplier-in-fixed .vault-welsh-pool u0))
    	(try! (contract-call? .alex-reserve-pool set-coinbase-amount .vault-welsh-pool ONE_8 ONE_8 u0 u0 u0))

		(try! (contract-call? .alex-reserve-pool set-coinbase-amount .fwp-wstx-wbtc-50-50-v1-01 amount-btc amount-btc amount-btc amount-btc amount-btc))
		(try! (contract-call? .alex-reserve-pool set-coinbase-amount .fwp-wstx-alex-50-50-v1-01 amount-alex amount-alex amount-alex amount-alex amount-alex))		
		(ok true)	
	)
)
