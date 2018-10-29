class JobsController < ApplicationController
  def index
    @job = Job.new
  end
end
