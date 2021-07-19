# frozen_string_literal: true

require 'snowplow-tracker'
require "singleton"

class Tracker
  include Singleton

  def page_view(page_url)
    tracker.track_page_view(page_url)
  end

  def screen_view(name)
    tracker.track_screen_view(name)
  end

  def ecommerce(transaction, items)
    tracker.track_ecommerce_transaction(transaction, items)
  end

  def struct(category, action)
    tracker.track_struct_event(category, action)
  end

  def self_describing(schema_name, event_properties)
    event_json = SnowplowTracker::SelfDescribingJson.new(
      schema_name, event_properties
    )
    tracker.track_self_describing_event(event_json)
  end

  # --------------------------------------
  private

  def tracker
    @tracker = SnowplowTracker::Tracker.new(emitter)
  end

  def emitter
    @emitter = SnowplowTracker::AsyncEmitter.new("localhost:9090")
  end

end
