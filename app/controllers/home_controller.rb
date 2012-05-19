class HomeController < ApplicationController
    def index
    	@statuses = {
    		:north => {
    			:statuses => [],
    			:today => nil
    			},
    		:south => {
    			:statuses => [],
    			:today => nil
    			}
    	}

    	%w{north south}.each do |loc|
    		@statuses[loc.to_sym] = getStatuses(7, loc)
    		@statuses[loc.to_sym][:today] = Status.find(:last, :conditions => ["DATE(date) = DATE(?) and location = ?", Time.now, loc])
    	end

        @oldest_status = Status.first(:order => "date asc")
    end
end
