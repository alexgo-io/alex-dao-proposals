(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant fifty-percent (/ ONE_8 u2)) ;; equal-weight pool (i.e. Uniswap-like)
(define-constant dy (* u3150000 ONE_8)) ;; 3,150,000 $ALEX / 10x IDO to ensure liquidity
(define-constant dx (/ (* dy u16) u100)) ;; 3,150,000 $ALEX at 0.16 STX / 504,000 STX
(define-constant oracle-average (/ (* ONE_8 u95) u100)) ;; resilient oracle follows (0.05 * now + 0.95 * resilient-oracle-before)
(define-constant fee-rebate (/ ONE_8 u2)) ;; 50% of tx fee goes to LPs
(define-constant fee-rate-x (/ (* ONE_8 u3) u1000)) ;; 0.3% charged on token-x when token-x is sold to buy token-y
(define-constant fee-rate-y (/ (* ONE_8 u3) u1000)) ;; 0.3% charged on token-y when token-y is sold to buy token-x


(define-public (execute (sender principal))
	(begin
		(try! (contract-call? .age000-governance-token mint-fixed dy .executor-dao))
		(try! (contract-call? .fixed-weight-pool create-pool 
			.token-wstx 
			.age000-governance-token 
			fifty-percent 
			fifty-percent 
			.fwp-wstx-alex-50-50 
			.multisig-fwp-wstx-alex-50-50 
			dx
			dy
		))
		(try! (contract-call? .fixed-weight-pool set-fee-rebate .token-wstx .age000-governance-token fifty-percent fifty-percent fee-rebate))
		(try! (contract-call? .fixed-weight-pool set-fee-rate-x .token-wstx .age000-governance-token fifty-percent fifty-percent fee-rate-x))
		(try! (contract-call? .fixed-weight-pool set-fee-rate-y .token-wstx .age000-governance-token fifty-percent fifty-percent fee-rate-y))
		(try! (contract-call? .fixed-weight-pool set-oracle-enabled .token-wstx .age000-governance-token fifty-percent fifty-percent))
		(contract-call? .fixed-weight-pool set-oracle-average .token-wstx .age000-governance-token fifty-percent fifty-percent oracle-average)
	)
)
