class BillsController < ApplicationController
  before_action :authenticate_teacher
  before_action :check_teacher_profile, only: [:show]
  before_action :find_bill, only: [:show, :edit, :update, :destroy]

  def new
    date = Date.today
    month = date.strftime("%B")
    year = date.strftime("%Y")
    str_date = date.to_s
    name = "Facture missions TA #{month} #{year}"
    number = "#{year}#{date.strftime('%m')}00001"
    @bill = Bill.new(name: name, number: number, date: str_date)
    authorize @bill
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.teacher = current_teacher
    @bill.customer = Customer.find_by_name("Le Wagon")
    if @bill.save
      qty = params[:working_days]
      dp = params[:daily_price]
      item_field_attributes = {
        description: "Mission TA journée",
        quantity: qty,
        daily_price: dp,
        price: (qty.to_i * dp.to_i).to_s
      }
      item = @bill.items.create!
      Field.find_each do |field|
        data = item_field_attributes[field.title.to_sym]
        item.item_fields.create!(field_id: field.id, data: data)
      end
      redirect_to bill_path(@bill)
    else
      render :new
    end
  end

  def show
    @customer = @bill.customer
    @items = @bill.items
    item_prices = @bill.item_fields.where(field_id: Field.find_by_title("price").id)
    @total_price = item_prices.reduce(0) { |sum, item_price| sum += item_price.data.to_i }
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "#{@bill.name}"
      end
    end
  end

  def index
    @bills = current_teacher.bills
    authorize @bills
  end

  def destroy
    if @bill.destroy
      redirect_to bills_path, notice: "Bill deleted!"
    else
      redirect_to bills_path, alert: "Sorry, something went wrong :/"
    end
  end

  def edit
    @working_days = @bill.items.first.item_fields.where(field_id: Field.find_by_title("quantity")).first.data
    @daily_price = @bill.items.first.item_fields.where(field_id: Field.find_by_title("daily_price")).first.data
  end

  def update
    if @bill.update(bill_params)
      qty = params[:working_days]
      dp = params[:daily_price]
      item_field_attributes = {
        description: "Mission TA journée",
        quantity: qty,
        daily_price: dp,
        price: (qty.to_i * dp.to_i).to_s
      }
      item = @bill.items.first
      @bill.fields.each do |field|
        item_field = item.item_fields.where(field_id: field.id).first
        data = item_field_attributes[field.title.to_sym]
        item_field.update(data: data)
      end
      redirect_to bill_path(@bill), notice: "Bill updated!"
    else
      render :edit, alert: "Try again"
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :number, :date)
  end

  def find_bill
    @bill = Bill.find(params[:id])
  end

  def check_teacher_profile
    if current_teacher.miss_profile?
      redirect_to edit_teacher_path(current_teacher), alert: "Complete your profile then see your bills..."
    end
  end
end
