class Ride < ActiveRecord::Base
  attr_accessible :gpx, :name
  has_attached_file :gpx
  has_many :hotspots, dependent: :destroy
  has_many :points, through: :hotspots
  has_many :goals
  belongs_to :user
  before_save :parse_file

  validates_attachment :gpx, :presence => true,
    :content_type => { :content_type => "application/octet-stream" },
    :size => { :in => 0..2.megabytes }


  def polyline
    Polylines::Encoder.encode_points(self.polyline_points)
  end

  def polyline_points
    self.points.map(&:latlng)
  end
 
  def track_id_to_js(id)
    content_tag(:script, :type => "text/javascript") do
      "var js_track_id = "+id.to_s;
    end
  end

  def polyline
    Polylines::Encoder.encode_points(self.polyline_points)
  end

  def parse_file
    tempfile = gpx.queued_for_write[:original]
    p gpx.inspect
    doc = Nokogiri::XML(tempfile)
    parse_xml(doc)
  end

  def parse_xml(doc)
    doc.root.elements.each do |node|
      parse_rides(node)
    end
  end

  def parse_rides(node)
    if node.node_name.eql? 'trk'
      node.elements.each do |n|
        parse_hotspot(n)
      end
    end
  end

  def parse_hotspot(node)
    if node.node_name.eql? 'trkseg'
      tmp_hotspot = Hotspot.new
      node.elements.each do |n|
        parse_points(n, tmp_hotspot) 
      end
      self.hotspots << tmp_hotspot
    end
  end

  def parse_points(node, tmp_hotspot)
    if node.node_name.eql? 'trkpt'
      tmp_point = Point.new
      tmp_point.latitude = node.attr("lat")
      tmp_point.longitude = node.attr("lon")
      node.elements.each do |n|
        tmp_point.name = n.text.to_s if node.name.eql? 'name'
        tmp_point.elevation = n.text.to_s if node.name.eql? 'ele'
        tmp_point.description = n.text.to_s if node.name.eql? 'desc'
        tmp_point.point_created_at = n.text.to_s if node.name.eql? 'time'
      end
      tmp_hotspot.points << tmp_point 
    end
  end

  def self.search(search)
    if search
      find(:all, conditions: ["LOWER(name) LIKE LOWER(?)
                               OR LOWER(location) LIKE LOWER(?)
                               OR LOWER(gpx_file_name) LIKE LOWER(?)", 
                               "%#{search}%",
                               "%#{search}%",
                               "%#{search}%"])
    else
      find(:all)
    end

  end
end
