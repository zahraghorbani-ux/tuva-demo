select person_id 
		, encounter_id
		, encounter_type	
		, encounter_group	
		, encounter_start_date :: date 	encounter_start_date
		, encounter_end_date :: date encounter_end_date
		, length_of_stay
		, admit_type_description
		, facility_name
		, facility_type
		, observation_flag
		, lab_flag
		, dme_flag
		, ambulance_flag
		, pharmacy_flag 
		, ed_flag 
		, snf_part_b_flag
		, primary_diagnosis_code	
		, primary_diagnosis_description
		, paid_amount	
		, claim_count	
		, inst_claim_count	
		, prof_claim_count
	from {{ source('core', 'encounter') }}