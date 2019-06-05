class StaticController < ApplicationController
  layout false, only: [:index]
  def pages
  end
  def index
  end
end
