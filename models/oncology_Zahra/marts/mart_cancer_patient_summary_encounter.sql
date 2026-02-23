with patient_spend as (
    select
        person_id,
        sum(coalesce(paid_amount,0)) as total_paid,
        count(*) as encounter_count,
        sum(case when cancer_primary_diag_fg = 1 then coalesce(paid_amount,0) else 0 end) as paid_cancer_primary
    from {{ ref('int_cancer_pop_encounters') }}
    group by 1
)
select
    s.person_id,
    s.primary_cancer_type,
    s.first_cancer_date,
    s.multiple_cancer_flag,
    p.total_paid,
    p.paid_cancer_primary,
    p.encounter_count,
    case
      when total_paid < 10000 then 'A.Low < 10k '
      when total_paid < 50000 then 'B.Medium 10k-50k'
      when total_paid < 100000 then 'C.High 50k-100k'
      else 'D.Very High > 100k'
    end as spend_bucket
from {{ ref('int_cancer_type_segmentation') }} s
left join patient_spend p
  on s.person_id = p.person_id