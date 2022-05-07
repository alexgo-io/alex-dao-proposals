(impl-trait .extension-trait.extension-trait)
(use-trait ft-trait .trait-sip-010.sip-010-trait)
(use-trait extension-trait .extension-trait.extension-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant err-get-balance-failed (err u6001))
(define-constant err-unauthorised (err u3000))

(define-map approved-recipient principal bool)
(define-data-var recipient-amount (list 200 {recipient: principal, amount: uint}) (list))

(define-private (check-is-approved)
	(ok (asserts! (default-to false (map-get? approved-recipient tx-sender)) err-unauthorised))
)

(define-private (is-dao-or-extension)
	(ok (asserts! (or (is-eq tx-sender .executor-dao) (contract-call? .executor-dao is-extension contract-caller)) err-unauthorised))
)

(define-public (set-approved-recipient (recipient principal) (approved bool))
	(begin 
		(try! (is-dao-or-extension))
		(ok true)
		;; (ok (map-set approved-recipient recipient approved))
	)
)

(define-private (set-recipient-amount-iter (recipient {recipient: principal, ratio: uint}) (apower-balance uint))
	(begin
		(var-set recipient-amount (unwrap-panic (as-max-len? (append (var-get recipient-amount) {recipient: (get recipient recipient), amount: (mul-down apower-balance (get ratio recipient))}) u200)))
		apower-balance
	)
)

(define-public (mint-apower (mint-burn-apower-trait <extension-trait>) (recipient-ratio (list 200 {recipient: principal, ratio: uint})))
	(let 
		(
			(apower-balance (unwrap! (contract-call? .token-apower get-balance-fixed .auto-alex) err-get-balance-failed))
		)
		(asserts! (is-eq (as-contract tx-sender) (contract-of mint-burn-apower-trait)) err-unauthorised)
		(try! (check-is-approved))
		(fold set-recipient-amount-iter recipient-ratio apower-balance)
		(contract-call? .executor-dao request-extension-callback mint-burn-apower-trait 0x00)
	)
)

(define-public (burn-apower (mint-burn-apower-trait <extension-trait>))
	(begin 
		(contract-call? .executor-dao request-extension-callback mint-burn-apower-trait 0x01)
	)
)

;; --- Extension callback

(define-public (callback (sender principal) (memo (buff 34)))
	(let 
		(
			(apower-balance (unwrap! (contract-call? .token-apower get-balance-fixed .auto-alex) err-get-balance-failed))	
		) 
		(try! (is-dao-or-extension))
		(and (is-eq memo 0x00) (is-ok (contract-call? .token-apower mint-fixed-many (var-get recipient-amount))))
    	(and (is-eq memo 0x01) (is-ok (contract-call? .token-apower burn-fixed apower-balance .auto-alex)))
		(var-set recipient-amount (list))	
		(ok true)
  	)
)

(define-private (mul-down (a uint) (b uint))
    (/ (* a b) ONE_8)
)