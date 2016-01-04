# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  mail       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class User < ActiveRecord::Base
  belongs_to :project

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mail, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
