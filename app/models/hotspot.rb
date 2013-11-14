class Hotspot < ActiveRecord::Base
  attr_protected
  belongs_to :ride
  has_many :points, dependent: :destroy

  def polyline
    Polylines::Encoder.encode_points(self.polyline_points)
  end

  def polyline_points
    self.points.map(&:latlng)
  end
end
