class InstitutionsController < ApplicationController
  def index
    if params[:query].present?
      @institutions = Institution.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @institutions = Institution.all
    end
  end
end
