class Location < ApplicationRecord
  # Direct associations

  has_many   :notes,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :fans,
             :through => :bookmarks,
             :source => :user

  # Validations

end
