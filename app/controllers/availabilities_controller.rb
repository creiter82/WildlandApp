class AvailabilitiesController < ApplicationController
  def new
  end

  def create
    @availability = Availability.new(availability_params)

    if @availability.save
      flash[:notice] = "You are signed up"
      redirect_to :back
    else
      flash[:danger] = "You were not signed up"
      redirect_to :back
    end
  end

  def destroy
    @availability = Availability.find(params[:id])

    if @availability.destroy
      flash[:notice] = "You were removed from the Roster"
    end
  end

  private

    def availability_params
      params.require(:availability).permit(:roster_id, :user_id)
    end

end
