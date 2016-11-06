class User < ApplicationRecord
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
