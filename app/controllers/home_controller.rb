class HomeController < ApplicationController
    def index
    	@today_status = Status.find(:first, :conditions => ["DATE(date) = DATE(?)", Time.now], :limit => 1)
        getStatuses(7)
    end
end
