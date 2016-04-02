# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :author, presence: true
  # validates :subs, length: { minimum: 1 }

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  has_and_belongs_to_many :subs
end
