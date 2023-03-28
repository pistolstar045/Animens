class ApplicationController < ActionController::Base
   before_action :authenticate_customer!, except: [:top]


  def after_sign_up_path_for(resource)
    customers_my_page_path
  end

  def after_sign_in_path_for(resource)
    customers_my_page_path
  end

def after_sign_out_path_for(resource)
    new_customer_session_path
end

 private

 def reject_customer
  @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer
  puts 'test1'

  if @customer.valid_password?(params[:customer][:password]) && @customer.is_customer_deleted
    flash[:notice] = "退会済みです。再度ご登録をお願い致します。"
    puts 'test2'
    redirect_to new_customer_session_path
  else
    puts 'test3'
    customer_session_path
  end
 end


end







