class JobsController < ApplicationController
  def index

    if (params[:interests].present?) || (params[:subjects].present?)
      allparams = []
      if params[:subjects].present?
      allparams << params[:subjects]
      end
      if params[:interests].present?
      allparams << params[:interests]
      end
      @keywords = Keyword.where("name ILIKE ?", "%#{allparams.join(',')}%")
      @jobs = Job.joins(:jobs_keywords).where('jobs_keywords.keyword_id IN (?)', @keywords.ids)
    else
      @jobs = Job.all
    end
  end
end
