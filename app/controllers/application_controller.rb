class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['USER_ID'] && password == ENV['PASSWORD']
      end
    end

    def getStatuses (limit = nil)
		if limit
    		@statuses = Status.find(:all, :order => "date desc", :limit => limit).reverse
    	else
    		@statuses = Status.find(:all, :order => "date desc").reverse
    	end

        @oldest_status = Status.first(:order => "date asc")
    	
    	yes = Status.count(:all,:conditions=>['status=?','t'])
    	no = Status.count(:all,:conditions=>['status=?','f'])
    	if 0 != yes+no
    		@yes_percent = 100.00 * yes / (yes + no)
    		@no_percent = 100.00 * no / (yes + no)
    	else
    		@yes_percent = 0
    		@no_percent = 0
    	end
    end
end
