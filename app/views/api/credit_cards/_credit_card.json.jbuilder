json.id credit_card.id
json.credit_limit credit_card.credit_limit
json.apr credit_card.apr
json.card_number credit_card.card_number
json.expiration_date credit_card.expiration_date
json.cvv credit_card.cvv
json.balance credit_card.balance
json.user_id credit_card.user_id

json.charges do
  json.partial! credit_card.charges, partial: 'api/charges/charge', as: :charge
end