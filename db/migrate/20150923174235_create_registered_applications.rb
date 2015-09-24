class CreateRegisteredApplications < ActiveRecord::Migration
  def change
    create_table :registered_applications do |t|
      t.string :url
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
