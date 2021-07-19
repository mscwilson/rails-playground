class HomeController < ApplicationController
  def index
    emitter = SnowplowTracker::Emitter.new("localhost:9090")
    tracker = SnowplowTracker::Tracker.new(emitter)
    tracker.track_page_view("home/index")
  end

  def about; end

  def history; end
end
