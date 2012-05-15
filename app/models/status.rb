class Status < ActiveRecord::Base
    validates :location, :inclusion => { :in => %w(north south),
    :message => "%{value} is not a valid location" }

	has_attached_file :photo,
		:styles => {
		:thumb  => "100x100",
		:medium => "200x200",
		:large => "600x400"
	},
	:storage => :s3,
	:s3_credentials => {	:access_key_id     => ENV['S3_KEY'],
							:secret_access_key => ENV['S3_SECRET'] },
	:path => ":attachment/:id/:style.:extension",
	:bucket => ENV['S3_BUCKET'],
	:s3_host_name => ENV['S3_HOST']
end