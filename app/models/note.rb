# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#

class Note < ActiveRecord::Base

  belongs_to :user, inverse_of: :notes

  validates :text, :user, presence: true
end
