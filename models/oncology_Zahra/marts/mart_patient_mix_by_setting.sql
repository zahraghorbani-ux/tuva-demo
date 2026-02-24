with base as (
    select
        person_id
        , encounter_id
        , encounter_type
        , encounter_group
        , coalesce(paid_amount, 0) as paid_amount
    from {{ ref('int_cancer_pop_encounters') }}
),
setting_agg as (
    select
        encounter_group
        , encounter_type
        , count(distinct person_id) as patient_count
        , count(distinct encounter_id) as encounter_count
        , sum(paid_amount) as total_paid
    from base
    group by 1 , 2
),
totals as (
    select
        sum(total_paid) as overall_paid
        , sum(encounter_count) as overall_encounters
    from setting_agg
)
select
    s.encounter_group
    , s.encounter_type
    , s.patient_count
    , s.encounter_count
    , s.total_paid
    , s.total_paid / nullif(t.overall_paid,0) as pct_of_total_paid
    , s.encounter_count / nullif(t.overall_encounters, 0) as pct_of_total_encounters_cnt
from setting_agg s
cross join totals t
order by s.total_paid desc