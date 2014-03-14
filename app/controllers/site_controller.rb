class SiteController < ApplicationController

	def index
    render text: is_authenticated?
	end 

	def privacy
	end

	def terms
	end
		

end