class Teacher < ActiveRecord::Base
  has_many :bills

  COMPANY_STATUS = ["AE", "SAS", "SARL", "EI"]

  validates :company_status, inclusion: { in: COMPANY_STATUS }, allow_nil: true, allow_blank: true
  validates :siret, format: { with: /\A\d{14}\z/,
    message: "SIRET is 14 numbers long" }, allow_nil: true
  validates :company_name, presence: true, allow_nil: true
  validates :company_address, presence: true, allow_nil: true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  def miss_profile?
    company_name.nil? || siret.nil? || company_address.nil?
  end
end
