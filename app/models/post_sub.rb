# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  sub_id     :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Postsub < ActiveRecord::Base
  validates :sub, :post, presence: true

  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub,
    inverse_of: :postsubs

  belongs_to :post,
    foreign_key: :post_id,
    class_name: :Post,
    inverse_of: :postsubs

end
