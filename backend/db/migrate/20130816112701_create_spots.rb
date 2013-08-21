class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.point :location, geographic: true, srid: 4326

      t.timestamps
    end
  end
end
