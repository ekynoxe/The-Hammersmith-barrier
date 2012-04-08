module HomeHelper
	def status_class(s)
		if s.status
			return "yes"
		else
			return "no"
		end
	end
end
