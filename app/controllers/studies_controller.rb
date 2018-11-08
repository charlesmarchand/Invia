class StudiesController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @studies = @job.studies
  end

  def show
    @job = Job.find(params[:job_id])
    @study = Study.find(params[:id])
    @user = current_user
    @diplomas = @study.diplomas
    @schools = {}

    condition = {}
    @count = 0
    condition[:difficulty] = params[:difficulty_id] if params[:difficulty_id].present?

    @diplomas.each do |diploma|

      f = diploma.schools

      if params[:address].present?
        f = f.near(params[:address], 50)
      end

       if params[:difficulty_id].present?
        f = f.where(condition)
      end

       if params[:cost_id].present?
         case params[:cost_id]
          when 1
            f = f.where(cost: 0)
          when 2
            f = f.where("cost >?", 0).where("cost <?", 1000)
          when 3
            f = f.where("cost >?", 1000).where("cost <?", 10000)
          when 4
            f = f.where("cost >?", 10000)
         end
       end

        @schools[diploma.id] = f
        @count = @count+ f.length
    end

  end

  def details
    @school = School.find(params[:id])
    @diploma_id = params[:diploma_id]
  end

  def add
    @school = School.find(params[:id])
    @diploma_id = params[:diploma_id]
  end

  def remove
    @school = School.find(params[:id])
    @diploma_id = params[:diploma_id]
  end



end
