class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to customers_my_page_path(current_customer.id)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_customer_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :profile_image, :introduction)
    end

    def ensure_current_customer
      if !customer_signed_in?
      redirect_to root_path
      end
    end
end

