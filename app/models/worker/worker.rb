class Worker::Worker < ApplicationRecord
  devise :database_authenticatable, :recoverable, :validatable
end
