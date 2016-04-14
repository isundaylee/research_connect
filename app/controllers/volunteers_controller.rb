class VolunteersController < ApplicationController
  def index
    @volunteers = Volunteer.all
    gon.volunteers = @volunteers.map(&:to_hash)
  end

  def chat
  end
end
