class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.all.count
    @apparel_count = Product.where(category_id: 1).count
    @electronic_count = Product.where(category_id: 2).count
    @furniture_count = Product.where(category_id: 3).count
  end
end
