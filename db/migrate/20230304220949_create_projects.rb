class CreateProjects < ActiveRecord::Migration[7.0]
  def change

    create_table :projects do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.datetime :due
      t.datetime :createdAt, null: false
      t.integer :status, null:false, default:0
      t.string :member

      # t.references :user, null: false, foreign_key: true
      # # This adds a new column named `user_id` to the `projects` table
      # # with a foreign key constraint that references the `id` column
      # # of the `users` table.

    
      
    end
  end
end
