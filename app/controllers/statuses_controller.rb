class StatusesController < ApplicationController
	def index
        @statuses_north = getStatuses(7, 'north')
        @statuses_south = getStatuses(7, 'south')

        @statuses_north['statuses'] = Status.find(:all, :order => "date desc", :conditions => ["location = ?", "north"])
        @statuses_south['statuses'] = Status.find(:all, :order => "date desc", :conditions => ["location = ?", "south"])
        
        @oldest_status = Status.first(:order => "date asc")
	end

	def graph_partition
		@nb_statuses_north_no  = Status.count(:all,:conditions=>['status=? and location = ?','t', "north"])
    	@nb_statuses_north_yes = Status.count(:all,:conditions=>['status=? and location = ?','f', "north"])
    	@nb_statuses_south_no  = Status.count(:all,:conditions=>['status=? and location = ?','t', "south"])
    	@nb_statuses_south_yes = Status.count(:all,:conditions=>['status=? and location = ?','f', "south"])

        @oldest_status = Status.first(:order => "date asc")
	end

    def graph_calendar
        @nb_statuses_north_no  = Status.count(:all,:conditions=>['status=? and location = ?','t', "north"])
        @nb_statuses_north_yes = Status.count(:all,:conditions=>['status=? and location = ?','f', "north"])
        @nb_statuses_south_no  = Status.count(:all,:conditions=>['status=? and location = ?','t', "south"])
        @nb_statuses_south_yes = Status.count(:all,:conditions=>['status=? and location = ?','f', "south"])

        @oldest_status = Status.first(:order => "date asc")
    end
end
