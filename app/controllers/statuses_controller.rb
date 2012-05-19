class StatusesController < ApplicationController
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
                        @statuses[loc.to_sym] = getStatuses(nil, loc)
                        @statuses[loc.to_sym][:today] = Status.find(:last, :conditions => ["DATE(date) = DATE(?) and location = ?", Time.now, loc])
                end

                @oldest_status = Status.first(:order => "date asc")
        end

        def show
                @date = Time.utc(params[:year].to_s, params[:month].to_s, params[:day].to_s)
                @statuses = Hash.new

                @statuses["north"] = Status.find(:all, :conditions => ["DATE(date) = DATE(?) and location = ?", @date, "north"])
                @statuses["south"] = Status.find(:all, :conditions => ["DATE(date) = DATE(?) and location = ?", @date, "south"])
        end
end
