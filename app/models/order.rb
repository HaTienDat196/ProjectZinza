class Order < ActiveRecord::Base
    PAYMENT_TYPES = [ "VND", "USD", "Bitcoin", "Bank Card" ]
end
