class StudiesController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @studies = @job.studies
  end

  def show
    @job = Job.find(params[:job_id])
    @study = Study.find(params[:id])
    @user = current_user
  end

  def details
    @school = School.find(params[:id])
    @diploma_id = params[:diploma_id]
  end


end
