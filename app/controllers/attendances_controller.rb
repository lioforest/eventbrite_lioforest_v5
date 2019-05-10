	class AttendancesController < ApplicationController


		def index
  			@attendance = Attendance.all
  		end

		def new
			
		end

		def create
		end

	end
