class InstitutionsController < ApplicationController
  def index
    if params[:query].present?
      @institutions = Institutions.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @institutions = Instiutions.all
    end
  end
end
