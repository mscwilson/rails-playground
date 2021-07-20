class HomeController < ApplicationController

  def index
  end

  def about
    Tracker.instance.page_view("home/about")
  end

  def history
    Tracker.instance.page_view("home/history")
  end

  # POST
  def track_page_view
    Tracker.instance.page_view(params[:page_url])
  end

  # POST
  def track_screen_view
    Tracker.instance.screen_view(params[:name])
  end

  # POST
  def track_ecommerce
    transaction = {
                    "order_id" => '12345',
                    "total_value" => 80.99,
                    "city" => 'Berlin',
                    "country" => 'DE',
                    "currency" => 'EUR'
                  }
    items = [{
                "sku" => 'ex0099',
                "price" => 20,
                "quantity" => 3,
                "category" => 'bulbs'
              },
              {
                "sku" => 'ex0361',
                "price" => 20.99,
                "quantity" => 1,
                "name" => 'watering can'
              }]
    Tracker.instance.ecommerce(transaction, items)
  end

  # POST
  def track_struct
    Tracker.instance.struct("test_event", "click")
  end

  # POST
  def track_self_describing
    schema_name = "iglu:test.mwilson/test-link/jsonschema/1-0-0"
    event_details = { linkId: "replace this schema!" }
    Tracker.instance.self_describing(schema_name, event_details)
  end

end
