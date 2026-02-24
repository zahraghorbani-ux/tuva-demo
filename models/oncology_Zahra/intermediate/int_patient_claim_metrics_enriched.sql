select *
	, cancer_paid / nullif(total_paid , 0) as pct_paid_cancer_related
	, case
      when total_paid < 10000 then 'A.Low < 10k '
      when total_paid < 50000 then 'B.Medium 10k-50k'
      when total_paid < 100000 then 'C.High 50k-100k'
      else 'D.Very High > 100k'
    end as spend_bucket
	, case
      when pct_paid_cancer_related < 0.1 then 'A. < 10% '
      when pct_paid_cancer_related < 0.2 then 'B. 10-20%'
      when pct_paid_cancer_related < 0.4 then 'C. 20-40%'
      when pct_paid_cancer_related < 0.6 then 'D. 40-60%'
      else 'E. >60%'
    end as pct_paid_cancer_related_bucket
from {{ ref('int_patient_claim_metrics') }}