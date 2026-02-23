select
    person_id
    , condition_code
    , recorded_date
    , claim_id
from {{ ref('stg_conditions') }} stg_conditions
where lower(condition_code) like 'c%'