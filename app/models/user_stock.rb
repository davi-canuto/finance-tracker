# == Schema Information
#
# Table name: user_stocks
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  stock_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock
end
