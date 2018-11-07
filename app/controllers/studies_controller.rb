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

    @diplomas.each do |diploma|
      @schools[diploma.id] = diploma.schools


        if (params[:address].present?)
          @filtered_by_address = School.near(params[:address], 50)
          @schools[diploma.id] = @filtered_by_address & diploma.schools
        end

        if (params[:cost_id].present?)
          case params[:cost_id]
          when 1
            @filtered_by_cost = School.where(cost: 0)
            @schools[diploma.id] =@filtered_by_cost & diploma.schools
          when 2
            @filtered_by_cost = School.where("cost >?", 0).where("cost <?", 1000)
            @schools[diploma.id] =@filtered_by_cost & diploma.schools
          when 3
            @filtered_by_cost = School.where("cost >?", 1000).where("cost <?", 10000)
            @schools[diploma.id] =@filtered_by_cost & diploma.schools
          when 4
            @filtered_by_cost = School.where("cost >?", 10000)
            @schools[diploma.id] =@filtered_by_cost & diploma.schools
          end
        end


        if (params[:difficulty_id].present?)
          case :difficulty_id
          when 1
            @filtered_by_difficulty = School.where(difficulty = 1)
            @schools[diploma.id] =@filtered_by_difficulty && diploma.schools
          when 2
            @filtered_by_difficulty = School.where(difficulty = 2)
            @schools[diploma.id] =@filtered_by_difficulty && diploma.schools
          when 3
            @filtered_by_difficulty = School.where(difficulty = 3)
            @schools[diploma.id] =@filtered_by_difficulty && diploma.schools
          when 4
            @filtered_by_diffculty = School.where(difficulty = 4)
            @schools[diploma.id] =@filtered_by_difficulty && diploma.schools
          end
        end
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
