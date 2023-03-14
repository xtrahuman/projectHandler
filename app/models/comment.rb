class Comment < ApplicationRecord
  after_save :update_comment_counter
  after_destroy :reduce_comment_counter
  belongs_to :user
  belongs_to :project

  validates :message, presence: true

  def update_comment_counter
    project.increment!(:comment_counter)
  end

  def reduce_comment_counter
    project.decrement!(:comment_counter)
  end
end
