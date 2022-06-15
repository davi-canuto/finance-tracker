# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  ticker     :string
#  name       :string
#  last_price :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :usre_stocks

  validates :name, :ticker, presence: true

  def self.new_lookup ticker_symbol
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_publishabe_key],
      endpoint: Rails.application.credentials.iex_client[:endpoint_sandbox]
    )

    begin
      self.new(
        ticker: ticker_symbol,
        name: client.company(ticker_symbol).company_name,
        last_price: client.price(ticker_symbol)
      )
    rescue => ex
      return nil
    end
  end

end
