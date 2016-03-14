# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  url         :string
#

class Project < ActiveRecord::Base
  has_many :users
  has_and_belongs_to_many :features, uniq: true

  default_scope { order('name') }

  validates :name, presence: true

  def has_feature?(feature)
  	features.include? feature
  end

  def to_s
    "#{name}"
  end
end
