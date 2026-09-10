class HomesController < ApplicationController
    def home
        @new_tweets = Tweet.includes(:user).order(created_at: :desc).limit(6)
    end
end
