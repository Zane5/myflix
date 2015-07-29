class RemoveVideoCategories < ActiveRecord::Migration
  def change
    drop_table :video_categories
  end
end
