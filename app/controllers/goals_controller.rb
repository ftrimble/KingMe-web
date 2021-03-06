class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # PUT /goals/complete_goal/1
  def complete_goal
    @goal = Goal.find params[:id]
    if params[:Complete] == "false" or params[:Complete] == "on"
      @goal.update_attribute(:completed, true)
    else
      @goal.update_attribute(:completed, false)
    end

    puts "Set goal to #{@goal.completed} : #{params[:complete]}"

    render nothing: true

  end

  # POST /goals
  # POST /goals.json
  def create
    puts "CREATING GOAL: #{params} \nGOAL_PARAMS: #{goal_params}"
    @goal = Goal.new(goal_params)
    ride_id = params[:goal]
    @goal.ride = Ride.find(ride_id[:ride_id])
    @goal.user = User.find(current_user.id)

    puts "Goal: #{@goal} : #{@goal.ride}"

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal.ride, notice: 'Goal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @goal }
      else
        format.html { render action: 'new' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = Goal.find params[:goal_id]
    @goal.destroy
    @ride = Ride.find params[:ride_id]
    respond_to do |format|
      format.html { redirect_to @ride }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      puts "SET_GOAL: #{params}"
      @goal = Goal.find(params[:goal_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:hotspot_id, :time)
    end
end
