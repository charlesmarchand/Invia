class StudiesController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @studies = Job.find(params[:job_id]).studies
  end

  def show
  end
end
