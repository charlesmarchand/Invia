class ProfessionalsController < ApplicationController
  def index
    @professional = Professional.new
  end
end
