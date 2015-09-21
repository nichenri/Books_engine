class Admins::NewBooksController < Admins::ApplicationController

  def index
    @additions = Addition.all
  end

end
