class User < ApplicationRecord
  before_save :geocode_current_location

  def geocode_current_location
    if self.current_location.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.current_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.current_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.current_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.current_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :avatar, AvatarUploader

  # Direct associations

  has_many   :received_requests,
             :class_name => "Request",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_requests,
             :class_name => "Request",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :notes,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :followed_bookmarked_locations,
             :through => :follows,
             :source => :bookmarked_locations

  has_many   :bookmarked_locations,
             :through => :bookmarks,
             :source => :location

  has_many   :followers,
             :through => :received_requests,
             :source => :sender

  has_many   :follows,
             :through => :sent_requests,
             :source => :recipient

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
