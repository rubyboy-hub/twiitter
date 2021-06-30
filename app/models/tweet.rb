class Tweet < ApplicationRecord
  belongs_to :user
  # belongs_to :follow
# belongs_to :follows, optional: true
  # belongs_to :follow

end
