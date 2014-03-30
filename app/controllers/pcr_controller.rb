class PcrController < ApplicationController

def index
end

def new
  @users = User.all.entries
end

def create
  Pcr.create_pcr( pcr_params )
  render :new
end

end

 def pcr_params
    params.require(:pcr).permit(:history_present_illness)
  end