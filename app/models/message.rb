class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :body, presence: true, length: { maximum: 255 }

  def time
    "#{created_at.strftime('%Y/%m/%d %H:%M:%S')}"
  end
end
