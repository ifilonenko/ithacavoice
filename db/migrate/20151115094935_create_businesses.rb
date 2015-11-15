class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.string :business_description
      t.string :email
      t.string :tagphoto_url
      t.string :tier

      t.timestamps null: false
    end
  end
end
