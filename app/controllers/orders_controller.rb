class OrdersController<ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
  @orders = Order.includes(:product).all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end
end
