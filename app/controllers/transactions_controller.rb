class TransactionsController < ApplicationController

  before_action :set_transaction, only: [:show, :update, :destroy]

  def index
    @transactions = Transaction.paginate(page: params[:page], per_page: 10)
    render json: @transactions
  end

  def show
    render json: @transaction
  end

  def create
    @transaction = Transaction.new(transactions_params)
    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transactions_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transactions_params
    params.require(:transaction).permit(:street, :price, :city, :zip, :state,
                                        :beds, :baths, :sq__ft, :type,
                                        :sale_date, :latitude, :longitude)
  end
end
