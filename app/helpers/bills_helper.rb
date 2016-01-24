module BillsHelper
  def city(address)
    return splitted_address(address)[1]
  end

  def street(address)
    return splitted_address(address)[0]
  end

  private

  def splitted_address(address)
    return address.split(", ")
  end
end
