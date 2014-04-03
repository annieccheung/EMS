class PcrsController < ApplicationController

  def index
    @pcrs = Pcr.all.entries
  end

  def new
    # @users = User.all.entries
    @pcr = Pcr.new
    @emt_1_options = User.options_for_emt_vet
    @emt_rookie_options = User.options_for_emt_rookie

  end

  def create
    # @pcr = Pcr.find_by(params[:id])
    @pcr = Pcr.create_pcr (pcr_params)
    redirect_to pcrs_url
  end

  def edit
    @pcr = Pcr.find_by_id ( params[:id] )
  end

  def update
    @pcr = Pcr.find_by_id( params[:id] )
    @pcr.update (pcr_params)
    redirect_to pcrs_url
  end
    

  def pcr_params
    params.require(:pcr).permit(:case_number, :emt_1_last_name, :emt_2_last_name, :emt_3_last_name, :incident_date, :on_scene, :transition, :depart_scene, :dispatched, :pt_last_name, :pt_first_name, :pt_middle_name, :pt_birthdate, :pt_age, :pt_sex, :pt_address, :pt_student_id, :pt_telephone, :pt_city, :pt_state, :pt_zip, :history_present_illness)
  end


end
