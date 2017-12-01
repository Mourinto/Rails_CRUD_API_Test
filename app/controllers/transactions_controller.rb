class TransactionsController < ApplicationController

  before_action :set_transaction, only: [:show, :update, :destroy]

  def index
    render json: Transaction.paginate(page: params[:page], per_page: 25)
  end

  def show
    render json: @transaction
  end

  def create
    @transaction = Transaction.new(transactions_params)
    if @transaction.save
      render json: @transaction, status: :ok
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update_attributes(transactions_params)
      render json: @transaction, status: :ok
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @transaction.destroy
     render json: :no_content, status: :no_content
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transactions_params
    params.require(:transaction).permit(:street, :price, :city, :zip, :state,
                                        :beds, :baths, :sq__ft, :category,
                                        :sale_date, :latitude, :longitude)
  end
end
