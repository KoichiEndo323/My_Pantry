class Public::StogaresController < ApplicationController

  def index
    @storages = Stogare.all
  end

end
