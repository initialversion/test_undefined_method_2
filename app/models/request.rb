class Request < ApplicationRecord
  # Direct associations

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => :sent_requests_count

  # Indirect associations

  # Validations

end
