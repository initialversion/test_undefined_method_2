class Note < ApplicationRecord
  # Direct associations

  belongs_to :location

  belongs_to :user

  # Indirect associations

  # Validations

end
