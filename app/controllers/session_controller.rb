class SiteController < ApplicationController

def new
  render text: "Display the log in form"
end

def start
  render text: "Log the user in."
end

def destroy
  render text: "Log the user out."  
end

end
