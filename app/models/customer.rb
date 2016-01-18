class Customer < ActiveRecord::Base
  has_many :bills

  def city
    return splitted_address[1..2].join(" ")
  end

  def street
    return splitted_address[0]
  end

  private

  def splitted_address
    return address.split(", ")
  end
end
