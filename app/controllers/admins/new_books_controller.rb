class Admins::NewBooksController < ApplicationController

  def index
    @additions = Addition.all
  end

end
