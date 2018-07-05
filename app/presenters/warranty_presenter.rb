class WarrantyPresenter < DatatablePresenter
  presents :warranty
  delegate :id, :name, :datebuyed, :product_model, :adress, :master, :started, :datefirststart, :created_at, to: :warranty

  def username
    link_to name, warranty_path(warranty)
  end

  def warranty_until
    build_html do
      span class: "label label-#{@warranty.warranty_have?.to_s}" do
        I18n.t("warranty.#{@warranty.warranty_have?.to_s}")
      end
    end
  end

  def row_data
    [id, human_datetime(datebuyed, '%Y-%m-%d'), username, product_model&.name, adress, master&.name, I18n.t(started), human_datetime(datefirststart, '%Y-%m-%d'), human_datetime(created_at), warranty_until]
  end

  class << self
    def columns
      [
        { title: '#', orderable: true,
          filter: {
            field: :id,
            type: 'text',
            klass: 'form-control search-input-text',
            data: { column: 0 }
          }
        },
        { title: 'Дата покупки', orderable: true,
          filter: {
            field: :datebuyed,
            type: 'date',
            klass: 'form-control search-input-text',
            data: { column: 1 }
          }
        },
        { title: 'Имя', orderable: true,
          filter: {
            field: :name,
            type: 'text',
            klass: 'form-control search-input-text',
            data: { column: 2 }
          }
        },
        { title: 'Котел', orderable: true,
          filter: {
            field: :product_model,
            type: 'text',
            klass: 'form-control search-input-text',
            data: { column: 3 }
          }
        },
        { title: 'Адрес', orderable: true,
          filter: {
            field: :adress,
            type: 'text',
            klass: 'form-control search-input-text',
            data: { column: 4 }
          }
        },
        { title: 'Мастер', orderable: true,
          filter: {
            field: :master,
            type: 'text',
            klass: 'form-control search-input-text',
            data: { column: 5 }
          }
        },
        { title: 'Старт', orderable: true,
          filter: {
            field: :started,
            type: 'select',
            options: start_options_for_select,
            klass: 'select2 search-input-text',
            style: 'width: 100%',
            data: { column: 6 }
          }
        },
        { title: 'Дата старта', orderable: true,
          filter: {
            field: :datefirststart,
            type: 'date',
            klass: 'form-control search-input-text',
            data: { column: 7 }
          }
        },
        { title: 'Создание', orderable: true,
          filter: {
            field: :created_at,
            type: 'date',
            klass: 'form-control search-input-text',
            data: { column: 8 }
          }
        },
        { title: 'Гарантия', orderable: true,
          filter: {
            field: :warranty_until,
            options: warranty_until_options_for_select,
            type: 'select',
            klass: 'select2 search-input-text',
            style: 'width: 100%',
            data: { column: 9 }
          }
        }
      ]
    end

    def sort_columns
      ['warranties.id', 'warranties.datebuyed', 'warranties.name', 'product_models.name', 'warranties.adress', 'masters.name', 'warranties.started', 'warranties.datefirststart', 'warranties.created_at', 'warranties.warranty_until']
    end

    def start_options_for_select
      [['Не выбрано', ''], ['Да', true], ['Нет', false]]
    end

    def warranty_until_options_for_select
      [['Не выбрано', ''], ['Действует', 'enabled'], ['Истекла', 'disabled'], ['Отсутствует', 'empty']]
    end
  end
end
