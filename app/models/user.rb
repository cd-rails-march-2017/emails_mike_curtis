class User < ApplicationRecord
  has_many :user_senders, class_name: 'Contact', foreign_key: 'recipient_id'
  has_many :user_recipients, class_name: 'Contact', foreign_key: 'sender_id'

  has_many :senders, class_name: 'User', through: 'user_senders'
  has_many :recipients, class_name: 'User', through: 'user_recipients'

end
