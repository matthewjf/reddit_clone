# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, :moderator, presence: true

  belongs_to :moderator,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  has_and_belongs_to_many :posts
end
