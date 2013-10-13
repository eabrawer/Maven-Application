class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs :project
      t.string :to

      t.timestamps
    end
    add_index :taggings, :tag_id
  end
end
