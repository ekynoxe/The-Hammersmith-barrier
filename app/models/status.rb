class Status < ActiveRecord::Base
    validates :location, :inclusion => { :in => %w(north south),
    :message => "%{value} is not a valid location" }
end