class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user_name, presence: true
  validates :project_counter, numericality: { greater_than_or_equal_to: 0 }
end
