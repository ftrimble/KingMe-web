class Goal < ActiveRecord::Base
  belongs_to :user
  belongs_to :ride
  attr_accessible :ride_id, :hotspot_id, :time, :user_id, :completed, :created_at, :updated_at
  def goal_params
    params.require(:goal).permit(:ride_id).tap do |whitelisted|
      whitelisted[:properties] = params[:goal][:ride_id]
    end
  end

end
