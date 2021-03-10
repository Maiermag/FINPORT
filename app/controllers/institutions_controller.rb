class InstitutionsController < ApplicationController
  def index
    @institutions = Institution.joins(:portfolios).where(portfolios: {user_id: nil}).uniq
    # if params[:query].present?
    #   @institutions = Institution.where("name ILIKE ?", "%#{params[:query]}%")
    # else
    #   @institutions = Institution.all
    # end
  end
end
