(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-public (execute (sender principal))
	(begin
		(try! (contract-call? .age000-governance-token edg-add-approved-contract .fwp-wstx-alex-tranched-64))
		(try! (contract-call? .fwp-wstx-alex-tranched-64 add-approved-contract 'SP1A6F9ABHQMVP92GH7T9ZBF029T1WG3SHPNMKT0D))
		(try! (contract-call? .fwp-wstx-alex-tranched-64 set-available-alex (* u15000000 ONE_8)))
		(ok true)	
	)
)