class Project < ApplicationRecord
  after_save :update_project_counter
  after_destroy :reduce_project_counter
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :comment_counter, numericality: { greater_than_or_equal_to: 0 }

  def update_project_counter
    user.increment!(:project_counter)
  end

  def reduce_project_counter
    user.decrement!(:project_counter)
  end
end
