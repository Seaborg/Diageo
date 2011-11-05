Order.transaction do
  (1..100).each do |i|
    Order.create(:name => "Customer #{i}", :address => "#{i} Main Street", :promotext => "#{i} Promo Text",
      :email => "customer-#{i}@example.com")
  end
end
