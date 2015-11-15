class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.string :product_name
      t.string :product_details
      t.string :product_price
      t.string :email
      t.string :tagphoto_url

      t.timestamps null: false
    end
  end
end
