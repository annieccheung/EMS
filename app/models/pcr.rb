class Pcr

  include Mongoid::Document
  include Mongoid::Timestamps

field :emt_1, type: String
field :emt_2, type: String
field :emt_3, type: String

field :incident_date, type: Time
field :case_number, type: String

field :on_scene, type: Time
field :transition, type: Time
field :depart_scene, type: Time
field :dispatched, type: Time

field :pt_last_name, type: String
field :pt_first_name, type: String
field :pt_middle_name, type: String
field :pt_birthdate, type: String
field :pt_age, type: String
field :pt_sex, type: String
field :pt_address, type: String
field :pt_student_id, type: String
field :pt_telephone, type: String
field :pt_city, type: String
field :pt_state, type: String
field :pt_zip, type:String

field :pt_med_history, type: Array
field :pt_medications, type: Array
field :suspect_etoh, type: Boolean
field :suspect_drug, type: Boolean
field :pt_allergies, type: Array

field :incident_location, type: String
field :cheif_complaint, type: String

field :vitals_time_1, type: Time
field :vitals_bp_1, type: String
field :vitals_pulse_1, type: String
field :vitals_resp_1, type: String
field :vitals_pulse_ox_1, type: String
field :vital_temp_1, type: String

field :vitals_time_2, type: Time
field :vitals_bp_2, type: String
field :vitals_pulse_2, type: String
field :vitals_resp_2, type: String
field :vitals_pulse_ox_2, type: String
field :vital_temp_2, type: String

field :glascow_eyes, type: Integer
field :glascow_verbal, type: Integer
field :glascow_motor, type: Integer
field :glascow_total, type: Integer

field :skin_color, type: String
field :skin_temp, type: String
field :skin_moisture, type: String
field :airway, type: String
field :breathing, type: String
field :pupils, type: String

field :secondary_head, type:String
field :secondary_neck, type:String
field :secondary_chest, type:String
field :secondary_lungs, type:String
field :secondary_abdomen, type:String
field :secondary_back, type:String
field :secondary_pelvis, type:String
field :secondary_extremities, type:String

field :pt_disposition, type: String
field :history_present_illness, type: String

field :med_direction_contact, type: Boolean
field :med_advisor, type: String
field :emt_caller, type: String
field :time_med_called, type: Time
field :med_advice_given, type: String

field :transport_destination, type: String
field :transport_by, type: String



  def self.create_pcr (params)
    pcr = Pcr.create (params)
    pcr if pcr
    # end
  end

end
