class HomeController < ApplicationController

  def index
    Tracker.instance.page_view("home/index")
  end

  def about
    Tracker.instance.page_view("home/about")
  end

  def history
    Tracker.instance.page_view("home/history")
  end

end
