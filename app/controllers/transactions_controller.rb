class TransactionsController < ApplicationController
  def show
    @entity = Entity.find(params[:id])
    @category = Group.find(params[:category_id])
  end

  def new
    @entity = Entity.new
    @categories = Group.where(user_id: current_user.id)
  end

  def create
    @entity = Entity.new(name: params[:entity][:name], amount: params[:entity][:amount], user_id: current_user.id,
                         group_id: params[:entity][:category])

    redirect_to category_transaction_path(params[:entity][:category], @entity.id) if @entity.save
  end
end
