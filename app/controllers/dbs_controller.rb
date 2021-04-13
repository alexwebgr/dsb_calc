class DbsController < ApplicationController
  def index
    if params[:start_date].nil?
      render json: { message: 'required param start_date missing' }, status: :unprocessable_entity and return
    end

    date = parse_start_date
    where_hash = {}
    where_hash[:merchant_id] = params[:merchant_id] unless params[:merchant_id].nil?
    where_hash[:created_at] = (date - 7.days)..date

    render json: Disbursement.where(where_hash), status: :ok
  end

  private

  def parse_start_date
    parts = params[:start_date].split('_')
    Time.new(parts[0], parts[1], parts[2])
  end
end
