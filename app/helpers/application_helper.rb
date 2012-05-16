module ApplicationHelper
	def logged_in?
		not request.authorization.nil?
	end

    def location_to_char loc
        ('<b>' + ("north" == loc ? "&#8607; N" : "&#8609; S") + '</b>').html_safe
    end
end
