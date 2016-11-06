class Request < ApplicationRecord
  # Direct associations

  belongs_to :recipient,
             :class_name => "User",
             :counter_cache => :received_requests_count

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => :sent_requests_count

  # Indirect associations

  # Validations

end
