module Worker

class Worker < Base::Worker
  devise :database_authenticatable, :recoverable
end

end
