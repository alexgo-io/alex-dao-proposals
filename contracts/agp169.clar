(impl-trait .proposal-trait.proposal-trait)

(define-constant ONE_8 (pow u10 u8))

(define-constant recipients
	(list
{ amount: u174220000000, recipient: 'SP3SJ5ERFK7H4TA4C8BXN7CHBFZJ2287BS25644CT }
{ amount: u174220000000, recipient: 'SP2VFRPK61M5MQAFSHBJ4QWXYGDD20RV55FMZ63HM }
{ amount: u174220000000, recipient: 'SP1WWTY9SBKA7GTB4CCTWR4H855MQ7MNSBN5XH8Z8 }
{ amount: u174220000000, recipient: 'SP18QG8A8943KY9S15M08AMAWWF58W9X1M90BRCSJ }
{ amount: u174220000000, recipient: 'SP19J34B0X3XQM4KV41X3BF3NX50PE41JPSMNXT6M }
{ amount: u174220000000, recipient: 'SPPM372R6AX8NA1FVSGAK7NFSERNY1CVVVGTHR07 }
{ amount: u174220000000, recipient: 'SP27BACHRZ417TEDHDJ3Y0SCPZP4HWE30KBVBB6FA }
{ amount: u174220000000, recipient: 'SPKF0KAGFJJ69J68SRGCWWXSBKXXBJEBM4SHDTT4 }
{ amount: u174220000000, recipient: 'SPTPD1Q1GMP18NH96PVXPWTFVF6AGKAC65209P7V }
{ amount: u174220000000, recipient: 'SPDMVHDEFZ1BBJE2G6XX4WTFSH5X0HKYW2ZXWJRH }
	)
)

(define-public (execute (sender principal))
	(begin
		(try! (contract-call? .age000-governance-token edg-mint-many recipients))
		(ok true)
	)
)
