class Comment < ActiveRecord::Base
  validates :body, presence: true 
    validates :user, presence: true
    validates :product, presence: true
    validates :rating, numericality: {only_integer: true}

    after_create_commit { CommentUpdateJob.perform_later(self, @user) }


  belongs_to :user
  belongs_to :product
end
