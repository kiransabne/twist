class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    Account.create(account_params)
    flash[:notice] = 'Your account has been successfully created.'
    redirect_to root_url
  end

  private

  def account_params
    params.require(:account).permit(:name)
  end
end
