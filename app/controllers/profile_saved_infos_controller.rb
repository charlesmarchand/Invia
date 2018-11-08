class ProfileSavedInfosController < ApplicationController
  def create
    @job = Job.find(params[:job_id])

    if params.has_key?(:studies)
      @save = []
      @study = Study.find(params[:study_id])
      params[:studies].each do |study|
        diploma = Diploma.find(study[:diploma])
        school = School.find(study[:school])
        profile_saved_info = ProfileSavedInfo.create(user_id: current_user.id, job_id: @job.id, study_id: @study.id, diploma_id: diploma.id, school_id: school.id)
        @save << profile_saved_info.save
        end
      if @save.all?
        respond_to do |format|
          format.html { redirect_to  dashboard_path }
          format.js
        end
      else
        respond_to do |format|
          format.html { render 'jobs/index' }
          format.js
        end
      end

    else
      @profile_saved_info = ProfileSavedInfo.new
      @profile_saved_info.user = current_user
      @profile_saved_info.job = @job
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
  end


  def destroy
    @profile_saved_info = params[:id].split("/").to_a
    if ! @profile_saved_info.empty?
       @profile_saved_info.each do |profile|
        ProfileSavedInfo.find(profile.to_i).destroy
      end
      redirect_to jobs_path
    else
      redirect_to jobs_path
    end
  end



  private

  def profile_saved_info_params
    params.permit(:job_id, :study_id, :studies)
  end
end
