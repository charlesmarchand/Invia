class ProfileSavedInfosController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @profile_saved_info = ProfileSavedInfo.new
    @profile_saved_info.job = @job
    @profile_saved_info.user = current_user
    if @profile_saved_info.save
      respond_to do |format|
        format.html { redirect_to jobs_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'jobs/index' }
        format.js
      end
    end
  end


  def destroy
    @job = Job.find(params[:job_id])
    ProfileSavedInfo.where(user_id: current_use,job_id: @job ).each do |profile|
      destroy(profile.id)
    end
  end



  private

  def profile_saved_info_params
    params.permit(:job_id)
  end
end
