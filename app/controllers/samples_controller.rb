class SamplesController < ApplicationController
  def index
    @samples = Sample.where(user: current_user)
  end

  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.create(sample_params)
    @sample.user = current_user
    if @sample.save
      redirect_to samples_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def sample_params
    params.require(:sample).permit(:name, :bpm, :key, :source, :audio_file)
  end
end
