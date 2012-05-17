module ApplicationHelper
	def logged_in?
		not request.authorization.nil?
	end
	
	def status_class(s)
		if s.status
			return "yes"
		else
			return "no"
		end
	end
end
