class JobsController < ApplicationController
  def index
    if (params[:interests].present?) || (params[:subjects].present?)
      allparams = []

      allparams = [ params[:interests].split, params[:subjects].split ].flatten

      search = []
      allparams.each do |keyword|
        search << Job.joins(:keywords).where("keywords.name ILIKE ?", "#{keyword}")
      end

      @jobs = search.flatten.each_with_object(Hash.new(0)) { |job,counts| counts[job] += 1 }
        .select { |_,number| number >= allparams.length }
        .keys
    else
      @jobs = Job.all
    end
  end

  def modal
    @job = Job.find(params[:id])
  end
end
