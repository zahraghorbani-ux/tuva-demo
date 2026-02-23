select
    person_id
    , count(distinct claim_id) as claim_count
    , count(distinct case
				    when cancer_related_claim_fg = 1 then claim_id
				end) as cancer_claim_count
    , sum(total_paid_amount) as total_paid
    , sum(case when cancer_related_claim_fg = 1 then total_paid_amount else 0 end) as cancer_paid
    , sum(case when cancer_related_claim_fg = 0 then total_paid_amount else 0 end) as non_cancer_paid
from {{ ref('int_cancer_pop_claims_with_fg') }}
group by 1