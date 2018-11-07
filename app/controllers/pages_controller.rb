class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end


  def dashboard

    @jobs = current_user.jobs.uniq

    render layout: 'application'

  end

  def dashboard_show
    @study = Study.find(params[:id])
    @job = Job.find(params[:job_id])
  end
end
