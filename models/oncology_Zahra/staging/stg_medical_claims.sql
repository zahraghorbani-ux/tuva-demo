select   person_id
  , claim_id
  , claim_line_number
  , claim_type
  , cast(claim_start_date as date) as claim_start_date
  , cast(claim_end_date as date) as claim_end_date
  , paid_amount
  , allowed_amount
  , charge_amount
 from {{ source('core', 'medical_claim') }}