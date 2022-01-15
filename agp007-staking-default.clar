(impl-trait .proposal-trait.proposal-trait)

(define-constant activation-threshold u1) ;; DAO activates staking pool
(define-constant activation-delay u525) ;; number of block-heights to pass before staking starts upon activation / ~ 3 day
(define-constant reward-cycle-length u525) ;; number of block-heights per cycle / ~ 3 days
(define-constant token-halving-cycle u100) ;; number of cycles before coinbase change / ~ 1 year
  
(define-public (execute (sender principal))
	(begin
    (try! (contract-call? .alex-reserve-pool set-activation-threshold activation-threshold))
    (try! (contract-call? .alex-reserve-pool set-activation-delay activation-delay))
    (try! (contract-call? .alex-reserve-pool set-reward-cycle-length reward-cycle-length))
    (contract-call? .alex-reserve-pool set-token-halving-cycle token-halving-cycle)
  )
)
