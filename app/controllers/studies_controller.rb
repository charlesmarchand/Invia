class StudiesController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @studies = @job.studies
  end

  def show
    @job = Job.find(params[:job_id])
    @study = Study.find(params[:id])
  end

  def details
    @school = School.find(params[:id])
  end


end
