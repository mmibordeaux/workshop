# == Schema Information
#
# Table name: features
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  icon        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Feature < ActiveRecord::Base

  has_and_belongs_to_many :projects, uniq: true
  has_many :users, through: :projects

  def to_s
    "#{name}"
  end
end
