class Vote < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  belongs_to :voteable, polymorphic: true
  validates :user_id, scope: [:voteable_id, :voteable_type], uniqueness: true
end
