class CreateGooglecredits < ActiveRecord::Migration
  def change
    create_table :googlecredits do |t|
      t.string :outh_token
      t.string :access_token
      t.string :refresh_token
      t.timestamps null: false
    end
  end
end
