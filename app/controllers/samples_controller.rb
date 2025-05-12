class SamplesController < ApplicationController
  def index
    @samples = Sample.where(user: current_user)
  end
end
