class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  validates :user, presence: true
  validates :user_id, scope: [:voteable_id, :voteable_type], uniqueness: true
end
