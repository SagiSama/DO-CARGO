class Worker::Worker < Base::Worker
  devise :database_authenticatable, :recoverable
end
