ThinkingSphinx::Index.define :warranty, with: :active_record do
  #fileds
  indexes name, sortable: true
  indexes phone
  indexes adress
  indexes comment
  indexes serial
  indexes product_model.name, as: :product_model
  indexes product_model.boiler.name, as: :boiler
  indexes master.name, as: :master
  indexes user.username, as: :user

  # attributes
  has user_id, master_id, product_model_id, created_at, updated_at
end
