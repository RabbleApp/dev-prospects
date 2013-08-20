require "test_helper"

class SpotTest < ActiveSupport::TestCase
  test ".close_to returns spots within the given distance to the coordinates" do
    close_spots = Spot.all.select{|spot| spot.location.distance(POINT) < 1000}

    spots = Spot.close_to(POINT, 1000)
    assert_equal close_spots, spots
  end

  test ".order_by_distance_to orders spots by the spot distance" do
    ordered_spots = Spot.all.sort_by{|spot| spot.location.distance(POINT) }

    spots = Spot.order_by_distance_to(POINT)
    assert_equal ordered_spots, spots
  end
end
