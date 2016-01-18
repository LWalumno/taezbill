Field.destroy_all

fields_attributes = [
  {
    name: "Description",
    unit: nil,
    title: "description"
  },
  {
    name: "Daily price",
    unit: "€",
    title: "daily_price"
  },
  {
    name: "Quantity",
    unit: nil,
    title: "quantity"
  },
  {
    name: "Price",
    unit: "€",
    title: "price"
  }
]

fields_attributes.each do |attr|
  Field.create!(attr)
end

Customer.destroy_all
lewagon = Customer.create!(
  name: "Le Wagon",
  company_name: "Lewagon",
  address: "24 rue Louis Blanc, 75010, Paris")
