class Reserve < ActiveRecord::Base
	attr_accessor :email_confirmation
	validates :name, presence: true, length: { maximum: 256 }
	validates :kana, length: { maximum: 256 }
	validates :email, presence: true, confirmation: true, email_format: true
	validates :email_confirmation, presence: true
	validates :number, presence: true, numericality: true, inclusion: { in: 1..10 }
end
