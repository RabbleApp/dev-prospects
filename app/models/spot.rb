class Spot < ActiveRecord::Base
  set_rgeo_factory_for_column :location, RGeo::Geographic.spherical_factory(srid: 4326)

  has_many :offers

  def self.close_to(point, distance)
    # Implement me
  end

  def self.order_by_distance_to(point)
    # Implement me
  end
end
