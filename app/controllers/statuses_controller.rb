class StatusesController < ApplicationController
	def index
        @statuses_north = getStatuses(7, 'north')
        @statuses_south = getStatuses(7, 'south')

        @statuses_north['statuses'] = Status.find(:all, :order => "date desc", :conditions => ["location = ?", "north"])
        @statuses_south['statuses'] = Status.find(:all, :order => "date desc", :conditions => ["location = ?", "south"])
        
        @oldest_status = Status.first(:order => "date asc")
	end

    def show
        @date = Time.utc(params[:year].to_s, params[:month].to_s, params[:day].to_s)

        @statuses_north = Status.find(:all, :conditions => ["DATE(date) = DATE(?) and location = ?", @date, "north"])
        @statuses_south = Status.find(:all, :conditions => ["DATE(date) = DATE(?) and location = ?", @date, "south"])
    end
end
