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
#  position    :integer
#  field_id    :integer
#

class Feature < ActiveRecord::Base
  has_and_belongs_to_many :projects, uniq: true
  has_many :users, through: :projects
  belongs_to :field
  default_scope { order('position') }

  def color
    field.color unless field.nil? or field.color.nil?
  end

  def to_s
    "#{name}"
  end
end
