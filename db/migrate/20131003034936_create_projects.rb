class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :avatar
      t.string :title
      t.text :essay
      t.belongs_to :user # Rails 4 way - adds user_id column
      # t.integer :user_id # Rails 3 way - adds user_id column
      t.timestamps
    end
  end
end
