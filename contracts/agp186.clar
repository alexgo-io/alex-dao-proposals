(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))
(define-constant amount u10000000)

(define-constant amount-btc (* u125 ONE_8))
(define-constant amount-alex (* u275 ONE_8))

(define-public (execute (sender principal))
	(begin
		(try! (contract-call? .age000-governance-token mint-fixed (* amount ONE_8) 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9))
		(try! (contract-call? .alex-reserve-pool set-coinbase-amount .fwp-wstx-wbtc-50-50-v1-01 amount-btc amount-btc amount-btc amount-btc amount-btc))
		(try! (contract-call? .alex-reserve-pool set-coinbase-amount .fwp-wstx-alex-50-50-v1-01 amount-alex amount-alex amount-alex amount-alex amount-alex))		
		(ok true)	
	)
)
