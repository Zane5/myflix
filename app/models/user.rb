class User < ActiveRecord::Base
  validates_presence_of :email, :password, :full_name
  validates_uniqueness_of :email
  has_secure_password validations: false

  has_many :queue_items, -> { order "position" }

  def normalize_queue_item_positions
    queue_items.each_with_index do |queue_item, index|
      queue_item.update(position: index + 1)
    end
  end
 
  def new_queue_item_position
    queue_items.count + 1
  end

  def current_user_queued_video?(video)
    queue_items.map(&:video).include?(video)
  end

  def queued_video?(video)
    queue_items.map(&:video).include?(video)
  end
end
