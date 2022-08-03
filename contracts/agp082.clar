(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant stx-recipients
	(list
{amount: (* u20 ONE_8), to: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9}
	)
)

(define-constant mia-recipients
	(list
{amount: (* u20 ONE_8), to: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9}
	)
)

(define-constant nycc-recipients
	(list
{amount: (* u20 ONE_8), to: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9}
	)
)

(define-constant slm-recipients
	(list
{amount: (* u20 ONE_8), to: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9}
	)
)

(define-constant diko-recipients
	(list
{amount: (* u20 ONE_8), to: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9}
	)
)

(define-constant auto-alex-recipients
	(list
{amount: (* u20 ONE_8), to: 'SP3K8BC0PPEVCV7NZ6QSRWPQ2JE9E5B6N3PA0KBR9}
	)
)

(define-private (check-err (result (response bool uint)) (prior (response bool uint)))
    (match prior 
        ok-value result
        err-value (err err-value)
    )
)

(define-private (transfer-from-tuple (recipient { to: principal, amount: uint }))
  (contract-call? .auto-alex transfer-fixed (get amount recipient) tx-sender (get to recipient) none)
)

(define-private (auto-alex-send-many (recipients (list 200 { to: principal, amount: uint})))
  (fold check-err (map transfer-from-tuple recipients) (ok true))
)

(define-public (execute (sender principal))
	(begin  
		(try! (contract-call? .token-wstx send-many stx-recipients))
		(try! (contract-call? .token-wmia send-many mia-recipients))
		(try! (contract-call? .token-wnycc send-many nycc-recipients))
		(try! (contract-call? .token-wslm send-many slm-recipients))
		(try! (contract-call? .token-wdiko send-many diko-recipients))
		(try! (auto-alex-send-many auto-alex-recipients))
		(ok true)
	)
)
