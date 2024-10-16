class PagesController < ApplicationController
  def home
  end

  def about
  end

  def projects
  end

  def contact
    @message = Message.new
  end
end
