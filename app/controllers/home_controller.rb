class HomeController < ApplicationController
  def index
    @cat = Cat.all.sample
    @winners = Cat.joins(:votes).select("cats.*, avg(votes.score) as avg_score").group("cats.id").order("avg_score DESC").limit(3)
  end
end
