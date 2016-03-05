class Gist < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :author,
            :link,
            :content,
            presence: true, uniqueness: { message: 'Gist already in your list. Search for another gist :)' }
end
