class JobsController < ApplicationController
  def index
   if params[:query].present?
      @keywords = Keyword.where("name ILIKE ?", "%#{params[:query]}%")
      @jobs = Job.joins(:jobs_keywords).where('jobs_keywords.keyword_id IN (?)', @keywords.ids)
    else
      @jobs = Job.all
    end
  end
end
