class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    @discount = @sale.value * (@sale.discount/100)
    @total = @sale.value - @discount
    if !params.has_key?(:tax)
      tax = 19
      total = 1.19
    else
      tax = 0
    end
    @sale.save
    redirect_to sales_path
  end


  def done
    @sale = Sale.last
  end


  private
  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end
end
