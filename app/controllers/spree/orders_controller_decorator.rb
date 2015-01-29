Spree::OrdersController.class_eval do

  def show
    @present_recurring = params["order_completed"] ? true : false

    @order = Spree::Order.find_by_number!(params[:id])
    @recurring_order = Spree::RecurringOrder.new

    @recurring_list = Spree::RecurringList.new(user: spree_current_user)

    if @present_recurring
      render :show_completed
    else
      render :show
    end
  end

end
