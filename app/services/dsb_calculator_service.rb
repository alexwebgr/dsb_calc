class DsbCalculatorService
  def self.calculate(amount)
    new(amount).calculate
  end

  def self.create_dsb
    new.create_dsb
  end

  private

  attr_reader :amount

  def initialize(amount = 0)
    @amount = amount
  end

  def fee_calc
    # TODO: move percentages to a RULES constant
    return 0.00 if amount.zero?
    return 1.00 if amount < 50
    return 0.95 if amount >= 50 && amount <= 300
    0.85 if amount > 300
  end

  public

  def calculate
    ((amount * fee_calc) / 100).round(3)
  end

  def create_dsb
    where_hash = {}
    where_hash[:completed_at] = (Time.current - 7.days)..Time.current

    orders = Order
      .completed
      .where(where_hash)

    orders.each do |order|
      Disbursement.create(
        merchant_id: order.merchant_id,
        amount_payable: DsbCalculatorService.calculate(order.amount)
      )
    end
  end
end