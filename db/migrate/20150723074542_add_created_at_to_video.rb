class AddCreatedAtToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :created_at, :datetime
    remove_column :videos, :create_at
  end
end
