select 'observation' as service
       , count(*) as encounter_count
       , count(distinct person_id) as patient_count
       , sum(coalesce(paid_amount,0)) as total_paid
from  {{ ref('int_cancer_pop_encounters') }}
where observation_flag = 1

union all
select 'lab', count(*), count(distinct person_id), sum(coalesce(paid_amount,0))
from  {{ ref('int_cancer_pop_encounters') }}
where lab_flag = 1

union all
select 'dme', count(*), count(distinct person_id), sum(coalesce(paid_amount,0))
from {{ ref('int_cancer_pop_encounters') }}
where dme_flag = 1

union all
select 'ambulance', count(*), count(distinct person_id), sum(coalesce(paid_amount,0))
from {{ ref('int_cancer_pop_encounters') }}
where ambulance_flag = 1

union all
select 'pharmacy', count(*), count(distinct person_id), sum(coalesce(paid_amount,0))
from {{ ref('int_cancer_pop_encounters') }}
where pharmacy_flag = 1

union all
select 'ed', count(*), count(distinct person_id), sum(coalesce(paid_amount,0))
from {{ ref('int_cancer_pop_encounters') }}
where ed_flag = 1

union all
select 'snf_part_b', count(*), count(distinct person_id), sum(coalesce(paid_amount,0))
from {{ ref('int_cancer_pop_encounters') }}
where snf_part_b_flag = 1