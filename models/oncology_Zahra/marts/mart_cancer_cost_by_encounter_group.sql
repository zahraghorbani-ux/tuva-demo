select
    encounter_group
    , sum(coalesce(paid_amount,0)) as total_paid
    , count(*) as encounter_count
    , count(distinct person_id) as patient_count
from {{ ref('int_cancer_pop_encounters') }}
group by 1