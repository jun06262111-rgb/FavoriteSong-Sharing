class AddAppleToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :apple, :text
  end
end
