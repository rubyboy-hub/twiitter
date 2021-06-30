class AddReferecnceToFollow < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :follows, :users, column: :following
  end
end
