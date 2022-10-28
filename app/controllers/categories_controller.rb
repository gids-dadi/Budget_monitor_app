require 'open-uri'

class CategoriesController < ApplicationController
  def index
    @groups = Group.left_outer_joins(:entities)
      .select('groups.*, COUNT(entities.id) as transactions_count, sum(entities.amount) as total_amount')
      .group('groups.id')
      .where(user_id: current_user.id)
  end

  def show
    @group = Group.left_outer_joins(:entities)
      .select('groups.*, COUNT(entities.id) as transactions_count, sum(entities.amount) as total_amount')
      .group('groups.id')
      .find(params[:id])
    @transactions = Entity.where(group_id: params[:id]).order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.create(group_params)
    redirect_to categories_path if @group.save
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
