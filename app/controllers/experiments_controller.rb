class ExperimentsController < ApplicationController
  def new
  end

  def preview
    @fields = JSON.parse(params[:fields])
  end

  def success
  end
end
