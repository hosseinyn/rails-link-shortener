require "securerandom"

class LinksController < ApplicationController
  def add
    @links = Link.all
  end

  def create

    if params[:full_url].include?("https://") || params[:full_url].include?("http://")

      random_short_link = SecureRandom.alphanumeric(7)
      @link = Link.new(full_url: params[:full_url] , short_link: random_short_link)
      if @link.save
        flash[:notice] = "Link created successfully."
        redirect_to "/links/add"
      end

    else
      flash[:alert] = "Link is not valid."
      redirect_to "/links/add"
    
    end

  end

  def show
    link_short_link = params[:short_link]

    @link = Link.find_by(short_link: link_short_link)

    if @link
      link_full_url = @link.full_url

      redirect_to(link_full_url, allow_other_host: true)

    else
      flash[:alert] = "Link not found."
      redirect_to root_path
      
    end

  end

end
