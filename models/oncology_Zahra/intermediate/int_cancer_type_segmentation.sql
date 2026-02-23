select
    person_id
    , primary_cancer_code
    , first_cancer_date
    , multiple_cancer_flag
    , case when left(lower(primary_cancer_code), 3) in  ('c18' , 'c19', 'c20') then 'Colorectal Cancer'
			   when left(lower(primary_cancer_code), 3) = 'c22' then 'Liver cancer'
			   when left(lower(primary_cancer_code), 3) = 'c25' then 'Pancreatic Cancer'
			   when left(lower(primary_cancer_code), 3) = 'c34' then 'Lung Cancer'
			   when left(lower(primary_cancer_code), 3) = 'c43' then 'Melanoma'
			   when left(lower(primary_cancer_code), 3) = 'c50' then 'Breast Cancer'
			   when left(lower(primary_cancer_code), 3) = 'c53' then 'Cervical Cancer'
			   when left(lower(primary_cancer_code), 3) = 'c56' then 'Ovarian Cancer'
			   when left(lower(primary_cancer_code), 3) = 'c61' then 'Prostate Cancer'
			   when left(lower(primary_cancer_code), 3) = 'c64' then 'Kidney Cancer'
			   when left(lower(primary_cancer_code), 3) = 'c67' then 'Bladder Cancer'
			   when left(lower(primary_cancer_code), 3) = 'c73' then 'Thyroid Cancer'
			   when left(lower(primary_cancer_code), 3) in ('c81', 'c82', 'c83', 'c84', 'c85', 'c86') then 'Lymphoma'
			   when left(lower(primary_cancer_code), 3) in ('c91', 'c92', 'c93', 'c94','c95') then 'Leukemia'
			   else 'other'
			  end Primary_cancer_type
from {{ ref('int_cancer_population') }}