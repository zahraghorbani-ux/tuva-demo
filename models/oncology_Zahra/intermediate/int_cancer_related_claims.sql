select distinct
  claim_id
from {{ ref('int_cancer_diagnoses') }}
