class AddTimestrampsToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :create_at, :timestamp 
  end
end
