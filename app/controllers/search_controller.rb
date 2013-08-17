class SearchController < ApplicationController

  def new
    @experts = Expert.all
  end

  def filter
    filters = { price: {} }
    filters[:price][:min_price] = params[:price_per_hour].split("-")[0].gsub!(/[^0-9]/, "").to_i
    filters[:price][:max_price] = params[:price_per_hour].split("-")[1].gsub!(/[^0-9]/, "").to_i
    @experts = filter_experts(filters)
  end

private
  def filter_experts(filters)
    min_price = filters[:price][:min_price]
    max_price = filters[:price][:max_price]

    return Expert.where(hourly_rate: (min_price..max_price))
  end

end
