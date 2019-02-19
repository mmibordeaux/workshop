# == Schema Information
#
# Table name: promotions
#
#  id           :integer          not null, primary key
#  diploma_year :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Promotion < ApplicationRecord
  has_many :users, dependent: :nullify

  default_scope { order(diploma_year: :desc) }
  
  def to_s
    "#{diploma_year}"
  end
end
