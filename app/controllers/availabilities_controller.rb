class AvailabilitiesController < ApplicationController
  def new
  end

  def create
    @availability = Availability.new(availability_params)

    if @availability.save
      flash[:success] = "You are signed up"
      redirect_to :back
    else
      flash[:danger] = "You were not signed up"
      redirect_to rosters_path
    end
  end

  def destroy
    @availability = Availability.find(params[:id])

    @availability.destroy
    flash[:danger] = "You've been removed from the Roster"
    redirect_to :back
  end

  private

    def availability_params
      params.require(:availability).permit(:roster_id, :user_id, :availability_position_id)
    end

end
