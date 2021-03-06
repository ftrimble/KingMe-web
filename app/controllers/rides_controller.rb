class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]

  # GET /rides
  # GET /rides.json
  def index
    if current_user
      @rides = Ride.where(user_id: current_user.id).search(params[:search])
    else
      redirect_to new_user_session_path, :alert => "You must be logged in to do that!"
    end
  end

  def stream
    @rides = Ride.search(params[:search])
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
    @points = @ride.points.paginate(page: params[:page])
    @ride = Ride.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { 
        render :json => @ride.to_json(:methods => [:polyline],:only => [:name]) 
      }
    end
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
  end

  # POST /rides
  # POST /rides.json
  def create
    @ride = Ride.new(params[:ride])
    @ride.name = ride_params[:name]
    @ride.user = User.find(current_user.id)
    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: 'Ride was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ride }
      else
        format.html { render action: 'new' }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rides/1
  # PATCH/PUT /rides/1.json
  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      params.require(:ride).permit(:id, :name, :location)
    end
end
