class StudiesController < ApplicationController
  def index
  end

  def show
    @study = Study.find(params[:id])
    @diplomas = @study.diplomas
    @diplomas.each { |diploma| @schools = diploma.schools}

     @markers = @schools.map do |school|
      {
        lat: school.latitude,
        lng: school.longitude
        #infoWindow: { content: render_to_string(partial: "/schools/map_box", locals: { school: school }) }
      }
    end
  end
end
