class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :location

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
