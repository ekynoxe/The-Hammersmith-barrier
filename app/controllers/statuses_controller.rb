class StatusesController < ApplicationController
	def index
        @statuses_north = getStatuses(7, 'north')
        @statuses_south = getStatuses(7, 'south')

        @statuses_north['statuses'] = Status.find(:all, :order => "date desc", :conditions => ["location = ?", "north"])
        @statuses_south['statuses'] = Status.find(:all, :order => "date desc", :conditions => ["location = ?", "south"])
        
        @oldest_status = Status.first(:order => "date asc")
	end

    def show
        if( params[:year].blank? ||
            params[:month].blank? ||
            params[:day].blank? ||
            params[:year].to_i == 0 ||
            params[:month].to_i == 0 ||
            params[:day].to_i == 0)

            redirect_to root_url
        else
            @date = Time.local(params[:year], params[:month], params[:day])

            @statuses_north = Status.find(:all, :conditions => ["DATE(date) = DATE(?) and location = ?", @date, "north"])
            @statuses_south = Status.find(:all, :conditions => ["DATE(date) = DATE(?) and location = ?", @date, "south"])
        end
    end
end
