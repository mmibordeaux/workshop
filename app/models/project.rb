# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  project    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ActiveRecord::Base
  has_many :users

  validates :name, presence: true

  def to_s
    "#{name}"
  end
end
