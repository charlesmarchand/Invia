class ProfileSavedInfosController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @study = Study.find(params[:study_id]) if ! @study.nil?
    @profile_saved_info = ProfileSavedInfo.new
    @profile_saved_info.user = current_user
    @profile_saved_info.job = @job
    @profile_saved_info.study = @study
    if @profile_saved_info.save
      if ! params[:study_id].nil?
        respond_to do |format|
          format.html { redirect_to  job_studies_path(@job) }
          format.js
        end
      else
        respond_to do |format|
          format.html { redirect_to jobs_path }
          format.js
        end
      end
    else
      respond_to do |format|
        format.html { render 'jobs/index' }
        format.js
      end
    end
  end


  def destroy
    @profil_saved_info = ProfileSavedInfo.find(params[:id])
    if ! @profil_saved_info.nil?
      @profil_saved_info.destroy
      redirect_to jobs_path
    else
        redirect_to jobs_path
    end
  end

  def schools_scrap

  end


  private

  def profile_saved_info_params
    params.permit(:job_id, :study_id)
  end
end
