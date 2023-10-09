(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))
(define-constant user 'SP32AK70FP7VNAD68KVDQF3K8XSFG99WKVD3C06AE)
(define-constant amount u2136964371100)
(define-constant tranche u1)

(define-public (execute (sender principal))
	(begin
		(try! (contract-call? .auto-fwp-alex-autoalex-x-v1-01 burn-fixed tranche amount user))
		(ok true)	
	)
)

