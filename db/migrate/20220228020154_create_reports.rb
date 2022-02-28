class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_enum :request_status, %w[new active done]

    create_table :requests do |t|
      t.string :region, null: false
      t.string :city, null: false
      t.string :address
      t.string :contact_name
      t.text :description
      t.string :phone
      t.string :viber
      t.string :telegram
      t.string :skype
      t.string :reporter_ip, null: false

      t.timestamps
    end

    add_index :requests, :created_at
    add_index :requests, :updated_at
  end
end
