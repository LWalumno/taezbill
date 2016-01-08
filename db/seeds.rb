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
