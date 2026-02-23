select
    person_id,
    normalized_code as condition_code,
    recorded_date,
    claim_id
from {{ source('core','condition') }}