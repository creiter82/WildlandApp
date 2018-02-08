class QualificationsController < ApplicationController
  before_action :set_qual, only: [:edit, :update, :destroy]

  access admin: :all

  def index
    @quals = Qualification.all
  end

  def new
    @qual = Qualification.new
  end

  def create
    @qual = Qualification.new(qual_params)
    if @qual.save
      flash[:success] = "#{@qual.name.titleize} was successfully created." 
      redirect_to qualifications_path
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @qual.update(qual_params)
      flash[:success] = "#{@qual.name.titleize} was successfully updated." 
      redirect_to qualifications_path
    else
      render :edit
    end
  end

  def destroy
    @qual.destroy

    flash[:danger] = "#{@qual.name.titleize} was successfully destroyed."

    redirect_to qualifications_path
  end

  private

    def set_qual
      @qual = Qualification.find(params[:id])
    end
      
    def qual_params
       params.require(:qualification).permit(:name, :acronym) 
    end
end
