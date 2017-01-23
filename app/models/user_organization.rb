class UserOrganization < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  enum status: {pending: 0, joined: 1, cancle: 2}

  scope :are_admin, ->{where is_admin: true}
  scope :find_with_user_of_company, ->user_id, organization_id do
    find_by user_id: user_id, organization_id: organization_id
  end

  delegate :name, to: :organization, allow_nil: :true
end
