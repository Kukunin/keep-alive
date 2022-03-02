class AddGpsColumnsToRequests < ActiveRecord::Migration[7.0]
  def change
    change_table :requests, bulk: true do |t|
      t.string :district
      t.string :instagram
      t.float :latitude, length: 8
      t.float :longitude, length: 8
    end
  end
end
