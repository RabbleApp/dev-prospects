require "csv"

task import: :environment do
  Offer.destroy_all
  offers = CSV.read("offers.csv")
  offers.delete_at(0)

  offers.each do |o|
    STDOUT.puts({id: o[0], title: o[1], highlight: o[2], description: o[3], spot_id: o[4].to_i, checkouts: o[4].to_i}.to_yaml)
  end

  Spot.destroy_all
  spots = CSV.read("spots.csv")
  spots.delete_at(0)

  spots.each do |s|
    location = Spot.rgeo_factory_for_column(:location).point(s[3], s[4])
    STDOUT.puts({id: s[0], name: s[1], address: s[2], location: location}.to_yaml)
  end
end
