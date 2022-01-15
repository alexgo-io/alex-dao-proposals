(impl-trait .proposal-trait.proposal-trait)

(define-constant reward-cycle-length u525) ;; number of block-heights per cycle / ~ 3 days
(define-constant token-halving-cycle u100) ;; number of cycles before coinbase change / ~ 1 year
  
(define-public (execute (sender principal))
	(begin
    (try! (contract-call? .alex-reserve-pool set-reward-cycle-length reward-cycle-length))
    (contract-call? .alex-reserve-pool set-token-halving-cycle token-halving-cycle)
  )
)
