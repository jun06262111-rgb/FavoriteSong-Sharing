class Tweet < ApplicationRecord
    belongs_to :user

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy

    # 必須項目
    validates :music_name, presence: true
    validates :music_artist, presence: true
    validates :music_year, presence: true
    validates :music_genre, presence: true
    validates :favorite_point, presence: true
    validates :review, presence: true
    validates :favorite_phrase, presence: true
    validates :youtube_url, presence: true
end