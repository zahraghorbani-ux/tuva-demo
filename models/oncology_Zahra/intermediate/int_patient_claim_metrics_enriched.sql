select *
	, case
      when total_paid = 0 then 0
      else cancer_paid / total_paid
    end as pct_paid_cancer_related
	, case
      when total_paid < 10000 then 'A.Low < 10k '
      when total_paid < 50000 then 'B.Medium 10k-50k'
      when total_paid < 100000 then 'C.High 50k-100k'
      else 'D.Very High > 100k'
    end as spend_bucket
from {{ ref('int_patient_claim_metrics') }}