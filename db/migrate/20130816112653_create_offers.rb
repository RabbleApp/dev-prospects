class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.string :highlight
      t.string :description
      t.integer :spot_id
      t.integer :checkouts

      t.timestamps
    end
  end
end
