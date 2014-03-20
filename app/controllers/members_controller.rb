class MembersController < ApplicationController

  def index
    @members = User.all.entries
  end

  def new
  end

  def create
  end

  def select
  end

  def update
  end

  def destroy
  end

end
