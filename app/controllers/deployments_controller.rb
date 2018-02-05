class DeploymentsController < ApplicationController
  before_action :set_deployment, only: [:show, :edit, :update, :destroy]
  before_action :check_active_user, only: [:edit]

  access user: {except: [:new, :destroy]}, admin: :all

  # GET /deployments
  # GET /deployments.json
  def index
    @deployments = Deployment.all
  end

  # GET /deployments/1
  # GET /deployments/1.json
  def show
  end

  # GET /deployments/new
  def new
    @deployment = Deployment.new
  end

  # GET /deployments/1/edit
  def edit
    @roster = Roster.find(@deployment.roster_id)
    @engine_boss = AvailabilityPosition.find_by_name('engine boss')
    @firefighter = AvailabilityPosition.find_by_name('firefighter')
    @engine_bosses = User.joins(:availabilities).where(availabilities: { availability_position_id: @engine_boss.id, roster_id: @roster.id }).order(:deployments_count, Availability.arel_table[:created_at])
    @ffs = User.joins(:availabilities).where(availabilities: { availability_position_id: @firefighter.id, roster_id: @roster.id }).order(:deployments_count, Availability.arel_table[:created_at])
  end

  # POST /deployments
  # POST /deployments.json
  def create
    @deployment = Deployment.new(deployment_params)

    respond_to do |format|
      if @deployment.save
        format.html { redirect_to @deployment, notice: 'Deployment was successfully created.' }
        format.json { render :show, status: :created, location: @deployment }
      else
        format.html { render :new }
        format.json { render json: @deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deployments/1
  # PATCH/PUT /deployments/1.json
  def update
    respond_to do |format|
      if @deployment.update(deployment_params)
        format.html { redirect_to @deployment, notice: 'Deployment was successfully updated.' }
        format.json { render :show, status: :ok, location: @deployment }
      else
        format.html { render :edit }
        format.json { render json: @deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deployments/1
  # DELETE /deployments/1.json
  def destroy
    @deployment.destroy
    respond_to do |format|
      format.html { redirect_to deployments_url, notice: 'Deployment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deployment
      @deployment = Deployment.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deployment_params
      params.require(:deployment).permit(:name, :location, :slug, :feature_image, {images: []}, :roster_id, user_ids:[])
    end

    def check_active_user
      forbidden! unless current_user.is_on_deployment?(@deployment) || logged_in?(:admin)
    end

end
