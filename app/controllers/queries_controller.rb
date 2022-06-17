require "open-uri"

class QueriesController < ApplicationController
  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)

    if @query.save
      redirect_to query_path(@query)
    else
      render :new
    end
  end

  def show
    query = Query.find(params[:id])
    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?limit=10&type=poi&proximity=#{query.lng},#{query.lat}&access_token=#{ENV['MAPBOX_API_KEY']}"
    json = URI.open(url).read
    @museums = JSON.parse(json)
    @results_hash = {}
  end

  private

  def query_params
    params.require(:query).permit(:lat, :lng)
  end
end
