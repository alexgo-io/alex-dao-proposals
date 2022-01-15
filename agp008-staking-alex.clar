(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant coinbase-1 (* u413000 ONE_8)) ;; emission of $ALEX per cycle in 1st year
(define-constant coinbase-2 (* u206500 ONE_8)) ;; emission of $ALEX per cycle in 2nd year
(define-constant coinbase-3 (* u103250 ONE_8)) ;; emission of $ALEX per cycle in 3rd year
(define-constant coinbase-4 (* u51625 ONE_8)) ;; emission of $ALEX per cycle in 4th year
(define-constant coinbase-5 (* u25813 ONE_8)) ;; emission of $ALEX per cycle in 5th year
(define-constant apower-multipler ONE_8) ;; APower multipler
  
(define-public (execute (sender principal))
	(begin
    (try! (contract-call? .alex-reserve-pool add-token .age000-governance-token))
    (try! (contract-call? .alex-reserve-pool set-coinbase-amount .age000-governance-token coinbase-1 coinbase-2 coinbase-3 coinbase-4 coinbase-5))
    (try! (contract-call? .alex-reserve-pool set-apower-multiplier-in-fixed .age000-governance-token apower-multipler))
    (contract-call? .alex-reserve-pool register-user .age000-governance-token (some u"$ALEX Staking Pool activated"))
  )
)
