class Teacher < ActiveRecord::Base
  has_many :bills

  COMPANY_STATUS = ["AE", "SAS", "SARL", "EI"]

  validates :company_status, inclusion: { in: COMPANY_STATUS }

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
