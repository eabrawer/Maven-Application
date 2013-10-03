class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :author
      t.text :essay

      t.timestamps
    end
  end
end
