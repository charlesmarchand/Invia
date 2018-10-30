class StudiesController < ApplicationController
  def index
  end

  def show
    @job = Job.find(params[:job_id])
    @study = Study.find(params[:id])
  end
end
