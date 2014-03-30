module PcrHelper
  
  def options_for_emt
    @options = []
    @users.each do |user|
      @options.inject([]) {user.id}
    end
    @options
  end

end