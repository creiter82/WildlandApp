class RostersController < ApplicationController
  before_action :set_roster, only: [:show, :edit, :update, :destroy]

  # GET /rosters
  # GET /rosters.json
  def index
    @rosters = Roster.all
  end

  # GET /rosters/1
  # GET /rosters/1.json
  def show
    @engine_boss = AvailabilityPosition.find_by_name('engine boss')
    @firefighter = AvailabilityPosition.find_by_name('firefighter')
    @engine_bosses = User.joins(:availabilities).where(availabilities: { availability_position_id: @engine_boss.id, roster_id: @roster.id }).order(Availability.arel_table[:created_at])
    @ffs = User.joins(:availabilities).where(availabilities: { availability_position_id: @firefighter.id, roster_id: @roster.id }).order(:deployments_count, Availability.arel_table[:created_at])
    # @ffs = User.joins(:availabilities).where(availabilities: { availability_position_id: @firefighter.id, roster_id: @roster.id }).order(:deployments_count, Availability.arel_table[:created_at])

    @eng_avail = @engine_bosses.sort_by{ |t| t.deployments.from_this_year.count }
    @ff_avail = @ffs.sort_by{ |t| t.deployments.from_this_year.count }

    @deployment = Deployment.new
  end

  # GET /rosters/new
  def new
    @roster = Roster.new
  end

  # GET /rosters/1/edit
  def edit
  end

  # POST /rosters
  # POST /rosters.json
  def create
    @roster = Roster.new(roster_params)
    @roster.name = "week of #{@roster.start_date.strftime("%m/%d/%Y")}"
    @roster.end_date = @roster.start_date.end_of_week

    respond_to do |format|
      if @roster.save
        format.html { redirect_to @roster, notice: "Roster for #{@roster.name} was successfully created." }
        format.json { render :show, status: :created, location: @roster }
      else
        format.html { render :new }
        format.json { render json: @roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rosters/1
  # PATCH/PUT /rosters/1.json
  def update
    respond_to do |format|
      if @roster.update(roster_params)
        format.html { redirect_to @roster, notice: 'Roster was successfully updated.' }
        format.json { render :show, status: :ok, location: @roster }
      else
        format.html { render :edit }
        format.json { render json: @roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rosters/1
  # DELETE /rosters/1.json
  def destroy
    @roster.destroy
    respond_to do |format|
      format.html { redirect_to rosters_url, notice: 'Roster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roster
      @roster = Roster.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roster_params
      params.require(:roster).permit(:name, :start_date, :end_date, :slug)
    end
end
