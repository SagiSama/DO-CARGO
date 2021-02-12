class Admin::Admin < ApplicationRecord
  devise :database_authenticatable, :recoverable
end
