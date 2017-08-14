class AvailabilitiesController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  private

    def availability_params
      params.require(:availability).permit(:roster_id, :user_id)
    end

end
