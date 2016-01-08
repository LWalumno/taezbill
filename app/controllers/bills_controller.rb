class BillsController < ApplicationController
  before_action :authenticate_teacher

  def new
    date = Date.today
    month = date.strftime("%B")
    year = date.strftime("%Y")
    str_date = date.to_s
    name = "Facture missions TA #{month} #{year}"
    number = str_date.split("-").join("") + "00001"
    @bill = Bill.new(name: name, number: number, date: str_date)
  end

  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      redirect_to bill_path(@bill)
    else
      render :new
    end
  end

  def show
    @bill = Bill.find(params[:id])
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :number, :date)
  end
end
