class Offer < ActiveRecord::Base
  belongs_to :spot

  def self.close_to(point, distance)
    # Implement me
  end

  def self.order_by_distance_to(point)
    # Implement me
  end
end
