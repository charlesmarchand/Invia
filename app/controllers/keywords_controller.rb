class KeywordsController < ApplicationController
  def index
    if params[:query].present?
      @keywords = Keyword.where("name ILIKE ?", "%#{params[:query]}%")
      @keywords.each do |keyword|
        @jobs = Job.where(keyword: keyword.id)
      end
    else
      @jobs = Job.all
    end
  end
end
