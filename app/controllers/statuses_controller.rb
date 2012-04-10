class StatusesController < ApplicationController
	def index
        @statuses_north = getStatuses(7, 'north')
        @statuses_south = getStatuses(7, 'south')

        @statuses_north['statuses'] = Status.find(:all, :order => "date desc", :conditions => ["location = ?", "north"]).reverse
        @statuses_south['statuses'] = Status.find(:all, :order => "date desc", :conditions => ["location = ?", "south"]).reverse
        
        @oldest_status = Status.first(:order => "date asc")
	end
end
