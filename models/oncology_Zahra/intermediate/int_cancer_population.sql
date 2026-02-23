with primary_cancer as (
select
    person_id
    , recorded_date as first_cancer_date
    , condition_code as primary_cancer_code
from {{ ref('int_cancer_diagnoses') }}
qualify row_number() over (
    partition by person_id
    order by recorded_date
) = 1

)

, multiple_cancers as (

select
    person_id
    , count(distinct left(condition_code,3)) as cancer_cnt
from {{ ref('int_cancer_diagnoses') }}
group by 1

)

select
    pc.person_id
    , pc.first_cancer_date
    , pc.primary_cancer_code
    , case when mc.cancer_cnt > 1 then 1 else 0 end as multiple_cancer_flag
from primary_cancer pc
join multiple_cancers mc
using(person_id)