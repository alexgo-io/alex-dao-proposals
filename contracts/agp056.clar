(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant reward-cycles (list u20 u21 u22 u23))
(define-constant ERR-GET-BALANCE-FIXED-FAIL (err u6001))

(define-private (claim-fwp-alex-staking-reward (reward-cycle uint))
  (contract-call? .alex-reserve-pool claim-staking-reward .fwp-wstx-alex-50-50-v1-01 reward-cycle)
)
(define-private (claim-fwp-wbtc-staking-reward (reward-cycle uint))
  (contract-call? .alex-reserve-pool claim-staking-reward .fwp-wstx-wbtc-50-50-v1-01 reward-cycle)
)
(define-private (claim-alex-staking-reward (reward-cycle uint))
  (contract-call? .alex-reserve-pool claim-staking-reward .age000-governance-token reward-cycle)
)

(define-public (execute (sender principal))
	(begin 
    	(map claim-alex-staking-reward reward-cycles)
		(map claim-fwp-alex-staking-reward reward-cycles)
		(map claim-fwp-wbtc-staking-reward reward-cycles)
		(let 
      		(
        		(claimed (unwrap! (contract-call? .age000-governance-token get-balance-fixed tx-sender) ERR-GET-BALANCE-FIXED-FAIL))
      		)
			(try! (contract-call? .age000-governance-token transfer-fixed claimed tx-sender 'SPSHEY24MHYHTNNZDSFV1YX18M8VH7GZSD5NS60G none))
			(ok true)	
		)
	)
)
