class User < ApplicationRecord
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

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
