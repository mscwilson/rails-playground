class HomeController < ApplicationController
  after_action :track_page_view, only: %i[index about history]

  def index
  end

  def about
  end

  def history
  end

  # POST
  def track_page_view
    Tracker.instance.page_view(request.original_url, request.headers["Referer"])
  end

  # POST
  def track_screen_view
    Tracker.instance.screen_view(params[:name], params[:id])
  end

  # POST
  def track_ecommerce
    transaction = {
                    "order_id" => "12345",
                    "total_value" => 80.99,
                    "currency" => "EUR"
                  }
    items = [{
               "sku" => "ex0099",
               "price" => 20,
               "quantity" => 3,
               "category" => "bulbs"
             },
             {
               "sku" => "ex0361",
               "price" => 20.99,
               "quantity" => 1,
               "name" => "watering can"
             }]
    Tracker.instance.ecommerce(transaction, items)
  end

  # POST
  def track_struct
    Tracker.instance.struct("test_event", "click")
  end

  # POST
  def track_self_describing
    schema = "iglu:test.example.iglu/dogs/jsonschema/1-0-0"
    event_details = { dog_name: "Ace",
                      breed: "pomeranian",
                      cuteness: "very high" }
    Tracker.instance.self_describing(schema, event_details)

    schema = "iglu:com.snowplowanalytics.snowplow/link_click/jsonschema/1-0-1"
    event_details = { targetUrl: "https://test.com",
                      elementClasses: [ "bold", "header" ]
                    }
    Tracker.instance.self_describing(schema, event_details)

    schema = "iglu:test.example.iglu/cart_action_event/jsonschema/1-0-0"
    Tracker.instance.self_describing(schema, { type: "add" })
  end
end
