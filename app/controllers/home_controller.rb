class HomeController < ApplicationController
    def index
    	@today_status_north = Status.find(:last, :conditions => ["DATE(date) = DATE(?) and location = ?", Time.now, "north"])
        @today_status_south = Status.find(:last, :conditions => ["DATE(date) = DATE(?) and location = ?", Time.now, "south"])

        @statuses_north = getStatuses(7, 'north')
        @statuses_south = getStatuses(7, 'south')

        @oldest_status = Status.first(:order => "date asc")
    end
end
