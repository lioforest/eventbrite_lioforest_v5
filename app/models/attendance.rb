class Attendance < ApplicationRecord
	after_create :email_event_confirmation

	def email_event_confirmation
		UserMailer.email_event_confirmation(self).deliver_now
	end

	belongs_to :event
	belongs_to :user
end
