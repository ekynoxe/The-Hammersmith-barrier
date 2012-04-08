class HomeController < ApplicationController
    def index 
    	@statuses = Status.find(:all, :order => "date desc", :limit => 7).reverse
    	@today_status = Status.find(:first, :conditions => ["DATE(date) = DATE(?)", Time.now], :limit => 1)
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
