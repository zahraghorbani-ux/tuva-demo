with base as (
  select
      primary_cancer_type
    , person_id
    , coalesce(total_paid, 0) as total_paid
  from {{ ref('mart_cancer_patient_summary_claim') }}
)
, agg as (
  select
      primary_cancer_type
    , count(distinct person_id) as patient_count
    , sum(total_paid) as total_paid
  from base
  group by 1
)
, totals as (
  select
      sum(patient_count) as total_patients
    , sum(total_paid) as overall_paid
  from agg
)
select
    a.primary_cancer_type
  , a.patient_count
  , a.total_paid
  , a.patient_count / nullif(t.total_patients, 0) as pct_of_patients
  , a.total_paid  / nullif(t.overall_paid, 0) as pct_of_total_paid
from agg a
cross join totals t
