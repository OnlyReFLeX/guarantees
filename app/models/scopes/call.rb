module Scopes
  module Call
    extend ActiveSupport::Concern

    included do
      scope :by_id, lambda { |id|
        where(id: id)
      }

      scope :by_call_date, lambda { |call_date|
        where('calls.call_date > ?', call_date)
      }

      scope :by_username, lambda { |username|
        where('calls.username ILIKE ?', "%#{username}%")
      }

      scope :by_phone, lambda { |phone|
        where('calls.phone ILIKE ?', "%#{phone}%")
      }

      scope :by_adress, lambda { |adress|
        where('calls.adress ILIKE ?', "%#{adress}%")
      }

      scope :by_product_model_name, lambda { |product_model_name|
        references(:product_model).where('product_models.name ILIKE ?', "%#{product_model_name}%")
      }

      scope :by_error, lambda { |error|
        where('calls.error ILIKE ?', "%#{error}%")
      }

      scope :by_master_name, lambda { |master_name|
        references(:master).where('masters.name ILIKE ?', "%#{master_name}%")
      }

      scope :by_created_at, lambda { |created_at|
        where('calls.created_at > ?', created_at)
      }

      scope :by_status, lambda { |status|
        where('calls.status ILIKE ?', "%#{status}%")
      }

      scope :by_guarantee, lambda { |guarantee|
        where(guarantee: guarantee)
      }
    end
  end
end
