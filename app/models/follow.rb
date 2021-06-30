class Follow < ApplicationRecord
  belongs_to :user
  has_many :tweets, class_name: "Tweets",foreign_key: "following"
  # belongs_to :tweets, class_name: "Tweets", optional: true
end
