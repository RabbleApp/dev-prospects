require "test_helper"

class OfferTest < ActiveSupport::TestCase
  test ".close_to returns offers within the given distance to the coordinates" do
    close_offers = Offer.all.select{|offer| offer.spot.location.distance(POINT) < 1000 }

    offers = Offer.close_to(POINT, 1000)
    assert_equal close_offers, offers
  end

  test ".order_by_distance_to orders offers by the spot distance" do
    ordered_offers = Offer.all.sort_by{|offer| offer.spot.location.distance(POINT) }

    offers = Offer.order_by_distance_to(POINT)
    assert_equal ordered_offers, offers
  end
end
