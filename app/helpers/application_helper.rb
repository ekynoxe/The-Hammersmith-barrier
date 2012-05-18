module ApplicationHelper
	def logged_in?
		not request.authorization.nil?
	end
	
	def status_class s
		s.status ? "yes" : "no"
	end

	def statuses_url_for_day s
		day_statuses_url(:year => s.date.year, :month => "%02d" % s.date.month, :day => "%02d" % s.date.day)
	end
end
