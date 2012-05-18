class Admin::StatusesController < ApplicationController
  before_filter :authenticate

  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.find(:all, :order => "date desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuses }
    end
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    @status = Status.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/new
  # GET /statuses/new.json
  def new
    @status = Status.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(params[:status])

    respond_to do |format|
      if @status.save
        if(!params[:status][:tweet_it].blank? && "0" != params[:status][:tweet_it])
          postTwitterStatus(@status)
        end

        format.html { redirect_to admin_status_url(@status), notice: 'Status was successfully created.' }
        format.json { render json: @status, status: :created, location: @status }
      else
        format.html { render action: "new" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statuses/1
  # PUT /statuses/1.json
  def update
    @status = Status.find(params[:id])

    respond_to do |format|
      if @status.update_attributes(params[:status])
        format.html { redirect_to admin_status_url(@status), notice: 'Status was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to admin_statuses_url }
      format.json { head :ok }
    end
  end

  def postTwitterStatus status
    require "twitter"

    Twitter.configure do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
      config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
    end
 
    # Initialize your Twitter client
    client = Twitter::Client.new

    # Post a status update
    client.update(status.date.strftime("%d/%m/%Y") + " at " + status.time.strftime("%I:%M%p").downcase! + ", the " + status.location + " barrier was " + (status.status? ? "in place" : "broken") + " http://ekx.im/hb")
  end
end
