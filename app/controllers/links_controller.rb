require "securerandom"

class LinksController < ApplicationController
  def add
    @links = Link.all
  end

  def create
    random_short_link = SecureRandom.alphanumeric(7)
    @link = Link.new(full_url: params[:full_url] , short_link: random_short_link)
    if @link.save
      flash[:notice] = "Link created successfully."
      redirect_to "/links/add"
    end

  end

end
