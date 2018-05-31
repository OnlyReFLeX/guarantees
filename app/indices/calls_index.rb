ThinkingSphinx::Index.define :call, with: :active_record do
  #fileds
  indexes username, sortable: true
  indexes phone
  indexes adress
  indexes error
  indexes whycanceled
  indexes infosuccess
  indexes comment
  indexes product_model.name, as: :product_model
  indexes product_model.boiler.name, as: :boiler
  indexes master.name, as: :master
  indexes user.username, as: :user
  indexes warranty.serial

  # attributes
  has user_id, master_id, warranty_id, product_model_id, created_at, updated_at
end
