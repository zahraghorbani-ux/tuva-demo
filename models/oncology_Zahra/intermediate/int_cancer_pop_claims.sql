select mc.person_id
   , mc.claim_id
   , min(mc.claim_start_date) as claim_start_date
   , cp.first_cancer_date
   , sum(coalesce(mc.paid_amount, 0))  total_paid_amount	-- for many multi-line claims paid amount populated on line 1 only 
from {{ ref('stg_medical_claims') }} mc
join {{ ref('int_cancer_population') }} cp
on mc.person_id = cp.person_id
where  mc.claim_start_date between cp.first_cancer_date and first_cancer_date + interval '12 months'
group by mc.person_id
   , mc.claim_id
   , cp.first_cancer_date