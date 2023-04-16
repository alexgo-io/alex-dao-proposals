(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))
(define-constant amount u30000000)

(define-public (execute (sender principal))
	(begin
		(try! (contract-call? .token-susdt set-approved-contract .bridge-endpoint-v1-01 true))
		(try! (contract-call? .age000-governance-token mint-fixed (* amount ONE_8) 'SP22PCWZ9EJMHV4PHVS0C8H3B3E4Q079ZHY6CXDS1))
		(ok true)	
	)
)
