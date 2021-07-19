# frozen_string_literal: true

require 'snowplow-tracker'
require "singleton"

class Tracker
  include Singleton

  def page_view(url)
    tracker.track_page_view(url)
  end

  def tracker
    @tracker = SnowplowTracker::Tracker.new(emitter)
  end

  def emitter
    @emitter = SnowplowTracker::AsyncEmitter.new("localhost:9090")
  end

end
