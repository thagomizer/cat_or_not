class HomeController < ApplicationController
  def index
    @cat = Cat.all.sample
  end
end
