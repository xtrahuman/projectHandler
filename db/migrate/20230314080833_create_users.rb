class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :name
      t.string :role
      t.text :bio
      t.integer :project_counter, null: false, default: 0

      t.timestamps
    end
  end
end
