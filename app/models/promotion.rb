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
  after_initialize :gather_users

  default_scope { order(:diploma_year) }
  
  def to_s
    "#{diploma_year}"
  end

  protected

  def gather_users
    User.where(diploma_year: diploma_year).each do |user|
      user.promotion = self
      user.save
    end
  end
end
