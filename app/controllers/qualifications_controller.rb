class QualificationsController < ApplicationController
  before_action :set_qual, only: [:edit, :update, :destroy]

  def index
    @quals = Qualification.all
  end

  def new
    @qual = Qualification.new
  end

  def create
    @qual = Qualification.new(qual_params)
    respond_to do |format|
      if @qual.save
        format.html { redirect_to qualifications_path, notice: "#{@qual.name.titleize} was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @qual.update(qual_params)
        format.html { redirect_to qualifications_path, notice: "#{@qual.name.titleize} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  end

  private

    def set_qual
      @qual = Qualification.find(params[:id])
    end
      
    def qual_params
       params.require(:qualification).permit(:name, :acronym) 
    end
end
