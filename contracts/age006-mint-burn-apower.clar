(impl-trait .extension-trait.extension-trait)
(use-trait ft-trait .trait-sip-010.sip-010-trait)
(use-trait extension-trait .extension-trait.extension-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant err-get-balance-failed (err u6001))
(define-constant err-unauthorised (err u3000))

(define-map approved-contract principal bool)
(define-data-var recipient-ratio (list 200 {recipient: principal, ratio: uint}) (list))

(define-private (check-is-approved)
	(ok (asserts! (default-to false (map-get? approved-contract tx-sender)) err-unauthorised))
)

(define-private (is-dao-or-extension)
	(ok (asserts! (or (is-eq tx-sender .executor-dao) (contract-call? .executor-dao is-extension contract-caller)) err-unauthorised))
)

(define-public (set-approved-contract (recipient principal) (approved bool))
	(begin 
		(try! (is-dao-or-extension))
		(ok (map-set approved-contract recipient approved))
	)
)

(define-private (set-recipient-amount-iter (recipient {recipient: principal, ratio: uint}) (prior {recipient-amount: (list 200 {recipient: principal, amount: uint}), apower-balance: uint}))
	{recipient-amount: (unwrap-panic (as-max-len? (append (get recipient-amount prior) {recipient: (get recipient recipient), amount: (mul-down (get apower-balance prior) (get ratio recipient))}) u200)), apower-balance: (get apower-balance prior)}
)

(define-public (mint-apower (mint-burn-apower-trait <extension-trait>) (recipients (list 200 {recipient: principal, ratio: uint})))
	(begin 
		(asserts! (is-eq (as-contract tx-sender) (contract-of mint-burn-apower-trait)) err-unauthorised)
		(try! (check-is-approved))
		(var-set recipient-ratio recipients)
		(contract-call? .executor-dao request-extension-callback mint-burn-apower-trait 0x00)
	)
)

(define-public (burn-apower (mint-burn-apower-trait <extension-trait>))
	(begin 
		(asserts! (is-eq (as-contract tx-sender) (contract-of mint-burn-apower-trait)) err-unauthorised)
		(try! (check-is-approved))	
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
		(and 
			(is-eq memo 0x00) 
			(is-ok (contract-call? .token-apower mint-fixed-many (get recipient-amount (fold set-recipient-amount-iter (var-get recipient-ratio) {recipient-amount: (list), apower-balance: apower-balance}))))
		)
    	(and (is-eq memo 0x01) (is-ok (contract-call? .token-apower burn-fixed apower-balance .auto-alex)))			
		(ok true)
  	)
)

(define-private (mul-down (a uint) (b uint))
    (/ (* a b) ONE_8)
)