select e.* 
, cp.first_cancer_date 
, case when lower(e.primary_diagnosis_code) like 'c%' then 1 else 0 end as cancer_primary_diag_fg
from {{ ref('stg_encounters') }} e
join {{ ref('int_cancer_population') }} cp
on e.person_id = cp.person_id
where  e.encounter_end_date between cp.first_cancer_date and cp.first_cancer_date + interval '12 months'