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

  def edit
    @sample = Sample.find(params[:id])
  end

  def update
    @sample = Sample.find(params[:id])
    if @sample.update(sample_params)
      redirect_to samples_path
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @sample = Sample.find(params[:id])
    @sample.destroy
    redirect_to samples_path, status: :see_other
  end

  private

  def sample_params
    params.require(:sample).permit(:name, :bpm, :key, :source, :private, :audio_file)
  end
end
