class Public::HomesController < ApplicationController
  def top
  end

  def search
    @teams = Sauna.search(params[:search])
  end
end
