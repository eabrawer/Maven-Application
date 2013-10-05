class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :essay
      t.belongs_to :user
      t.timestamps
    end
  end
end
