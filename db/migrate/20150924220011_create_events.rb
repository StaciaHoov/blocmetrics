class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :registered_application_id

      t.timestamps null: false
    end
  end
end
