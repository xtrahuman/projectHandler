class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.boolean :status, null: false, default: false
      t.string :name, null: false
      t.integer :comment_counter, null:false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
