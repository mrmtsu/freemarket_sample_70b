class Card < ApplicationRecord

  belongs_to :user

  validates :customer_id, presence: true
  validates :card_id, presence: true

  require 'payjp'
  Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']

  def self.create_card_to_payjp(params)
    # トークンを作成 
    token = Payjp::Token.create({
      card: {
        number:     params['number'],
        cvc:        params['cvc'],
        exp_month:  params['valid_month'],
        exp_year:   params['valid_year']
      }},
      {'X-Payjp-Direct-Token-Generate': 'true'} 
    )
    # 上記で作成したトークンをもとに顧客情報を作成
    Payjp::Customer.create(card: token.id)
  end
  
end
