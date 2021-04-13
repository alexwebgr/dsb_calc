namespace :dsb do
  desc "Create completed orders"
  task create_completed_orders: :environment do
    merchants = Merchant.first(5).pluck(:id)
    shoppers = Shopper.first(5).pluck(:id)
    merchants_l = Merchant.last(5).pluck(:id)
    shoppers_l = Shopper.last(5).pluck(:id)

    5.times do |num|
      Order.create(
        merchant_id: merchants[num],
        shopper_id: shoppers[num],
        amount: rand(1.01..500.01).round(3),
        completed_at: Time.current - num.days
      )
    end

    5.times do |num|
      Order.create(
        merchant_id: merchants_l[num],
        shopper_id: shoppers_l[num],
        amount: rand(1.01..500.01).round(3),
        completed_at: Time.current - num.days
      )
    end
  end

  desc "Create not completed orders"
  task create_orders: :environment do
    merchants = Merchant.first(5).pluck(:id)
    shoppers = Shopper.first(5).pluck(:id)
    merchants_l = Merchant.last(5).pluck(:id)
    shoppers_l = Shopper.last(5).pluck(:id)

    5.times do |num|
      Order.create(
        merchant_id: merchants[num],
        shopper_id: shoppers[num],
        amount: rand(1.01..500.01).round(3),
        completed_at: nil
      )
    end

    5.times do |num|
      Order.create(
        merchant_id: merchants_l[num],
        shopper_id: shoppers_l[num],
        amount: rand(1.01..500.01).round(3),
        completed_at: nil
      )
    end
  end
end

