class HomeController < ApplicationController

  def index
  end

  def about
    Tracker.instance.page_view("home/about")
  end

  def history
    Tracker.instance.page_view("home/history")
  end

  def page_view
    Tracker.instance.page_view(params[:url])
  end

end
