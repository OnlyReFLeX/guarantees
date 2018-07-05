module Scopes
  module Warranty
    extend ActiveSupport::Concern

    included do
      scope :by_id, lambda { |id|
        where(id: id)
      }

      scope :by_datebuyed, lambda { |datebuyed|
        where('datebuyed > ?', datebuyed)
      }

      scope :by_name, lambda { |name|
        where('name ILIKE ?', "%#{name}%")
      }

      scope :by_product_model, lambda { |product_model_name|
        references(:product_model).where('product_models.name ILIKE ?', "%#{product_model_name}%")
      }

      scope :by_adress, lambda { |adress|
        where('adress ILIKE ?', "%#{adress}%")
      }

      scope :by_started, lambda { |started|
        where(started: started)
      }

      scope :by_master_name, lambda { |master_name|
        references(:master).where('masters.name ILIKE ?', "%#{master_name}%")
      }

      scope :by_datefirststart, lambda { |datefirststart|
        where('created_at > ?', datefirststart)
      }

      scope :by_created_at, lambda { |created_at|
        where('created_at > ?', created_at)
      }

      scope :serials, lambda { |term|
        where('serial ILIKE ?', "%#{term}%").limit(6).pluck(:serial)
      }

      scope :by_warranty_until, lambda { |warranty|
        case warranty
        when 'empty'
          where(warranty_until: nil)
        when 'enabled'
          where('warranty_until > ?', Time.current)
        when 'disabled'
          where('warranty_until < ?', Time.current)
        end
      }
    end
  end
end
