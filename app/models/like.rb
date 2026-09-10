class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  
  #validates_uniqueness_ofによって、tweet_idとuser_id　の組が1組しかないようにバリデーションをかける
  validates_uniqueness_of :tweet_id, scope: :user_id
end
