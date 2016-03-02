# == Schema Information
#
# Table name: fields
#
#  id         :integer          not null, primary key
#  name       :string
#  color      :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Field < ActiveRecord::Base
  has_many :features
  default_scope { order('position') }

  validates :name, presence: true
  validates :color, presence: true
  validates :position, presence: true

  def to_s
    "#{name}"
  end
end
