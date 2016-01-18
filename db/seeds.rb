Field.destroy_all

fields_attributes = [
  {
    name: "Description",
    unit: nil
  },
  {
    name: "Daily price",
    unit: "€"
  },
  {
    name: "Quantity",
    unit: nil
  },
  {
    name: "Price",
    unit: "€"
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
