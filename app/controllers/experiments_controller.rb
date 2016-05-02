class ExperimentsController < ApplicationController
  def new
  end

  def preview
    @fields = JSON.parse(params[:fields])
  end

  def success
    flash[:success] = "You have successfully posted a experiment post! What else do you want to do? "
    redirect_to :root
  end
end
