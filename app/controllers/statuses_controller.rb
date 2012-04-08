class StatusesController < ApplicationController
	def index
		getStatuses
		@statuses = Status.find(:all, :order => "date desc").reverse
	end
end
