class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['USER_ID'] && password == ENV['PASSWORD']
      end
    end

    def getStatuses (limit = nil, location = 'north')
        statuses_report = {}
        
        if limit
            statuses_report["statuses"] = Status.find(:all, :order => "date desc, time desc", :limit => limit, :conditions => ["location = ?", location])
    	else
    		statuses_report["statuses"] = Status.find(:all, :order => "date desc, time desc", :conditions => ["location = ?", location])
        end

    	yes = Status.count(:all,:conditions=>['status=? and location = ?','t', location])
    	no = Status.count(:all,:conditions=>['status=? and location = ?','f', location])
    	if 0 != yes+no
    		statuses_report['yes_percent'] = 100.00 * yes / (yes + no)
    		statuses_report['no_percent'] = 100.00 * no / (yes + no)
    	else
    		statuses_report['yes_percent'] = 0
    		statuses_report['no_percent'] = 0
    	end

        statuses_report
    end
end
