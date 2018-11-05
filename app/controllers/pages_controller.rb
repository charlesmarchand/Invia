class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    render layout: 'application-homepage'
  end


  def dashboard


    @jobs = current_user.jobs
    render layout: 'application'

  end
end
