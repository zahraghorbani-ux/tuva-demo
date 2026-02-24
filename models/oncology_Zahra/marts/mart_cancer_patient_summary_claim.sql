select
    s.person_id
    , s.primary_cancer_type
    , s.first_cancer_date
    , s.multiple_cancer_flag
    , m.claim_count
    , m.cancer_claim_count
    , m.total_paid
    , m.cancer_paid
    , m.non_cancer_paid
    , m.pct_paid_cancer_related
    , m.spend_bucket
    , m.pct_paid_cancer_related_bucket
from {{ ref('int_cancer_type_segmentation') }} s
left join {{ ref('int_patient_claim_metrics_enriched') }} m
on s.person_id = m.person_id