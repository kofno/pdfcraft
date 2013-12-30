class HomeController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.pdf { render pdf: "contents" }
    end
  end

  def another
    render pdf: "contents", template: "home/index"
  end

  def partials
    render pdf: "contents"
  end

  def helpers
    render pdf: "contents"
  end
end
