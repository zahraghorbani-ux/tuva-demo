select cc.*
   , case when cr.claim_id is not null then 1 else 0 end as cancer_related_claim_fg
from {{ ref('int_cancer_pop_claims') }} cc
left join {{ ref('int_cancer_related_claims') }} cr
on cr.claim_id = cc.claim_id