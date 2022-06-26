(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant expiry u66550)
(define-constant crp-balance (* u300 ONE_8))
(define-constant crp-fee u0)
(define-constant crp-fee-rebate u0)
(define-constant crp-ltv-0 (/ (* u75 ONE_8) u100))
(define-constant crp-conversion-ltv (/ (* u95 ONE_8) u100))
(define-constant crp-bs-vol (/ (* u60 ONE_8) u100))
(define-constant crp-moving-average u0)
(define-constant crp-token-to-maturity (* u525 ONE_8))

(define-public (execute (sender principal))
	(begin 
        (try! (contract-call? .collateral-rebalancing-pool-v1 create-and-configure-pool .age000-governance-token .auto-alex expiry .yield-alex-v1 .key-alex-autoalex-v1 .multisig-crp-alex-autoalex-v1 crp-ltv-0 crp-conversion-ltv crp-bs-vol crp-moving-average crp-token-to-maturity crp-fee-rebate crp-fee crp-fee crp-balance))
        (ok true)
    )
)
