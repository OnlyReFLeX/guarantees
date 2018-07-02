class CallPresenter < DatatablePresenter
  presents :call
  delegate :id, :call_date, :username, :phone, :adress, :product_model, :error, :master, :created_at, :guarantee, to: :call

  def name
    link_to username, call_path(call)
  end

  def status
    build_html do
      span class: "label label-#{call.status}" do
        I18n.t(call.status)
      end
    end
  end

  def row_data
    [id, human_datetime(call_date, '%Y-%m-%d'), name, phone, adress, product_model&.name, error, master&.name, human_datetime(created_at), status, I18n.t(guarantee)]
  end

  class << self
    def columns
      [
        { title: '#', orderable: true,
          filter: {
            field: :id,
            type: 'text',
            klass: 'form-control search-input-text',
            data: { column: 0 },
          }
        },
        { title: 'Дата вызова', orderable: true,
          filter: {
            field: :call_date,
            type: 'date',
            klass: 'form-control search-input-text',
            data: { column: 1 }
          }
        },
        { title: 'Имя', orderable: true,
          filter: {
            field: :username,
            type: 'text',
            klass: 'form-control search-input-text',
            data: { column: 2 }
          }
        },
        { title: 'Телефон', orderable: true,
          filter: {
            field: :phone,
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
        { title: 'Модель', orderable: true,
          filter: {
            field: :product_model_name,
            type: 'text',
            klass: 'form-control search-input-text',
            data: { column: 5 }
          }
        },
        { title: 'Ошибка', orderable: true,
          filter: {
            field: :error,
            type: 'text',
            klass: 'form-control search-input-text',
            data: { column: 6 }
          }
        },
        { title: 'Мастер', orderable: true,
          filter: {
            field: :master_name,
            type: 'text',
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
        { title: 'Статус', orderable: true,
          filter: {
            field: :status,
            type: 'select',
            options: status_options_for_select,
            klass: 'select2 search-input-text',
            style: 'width: 100%',
            data: { column: 9 }
          }
        },
        { title: 'Гарантийный', orderable: true,
          filter: {
            field: :guarantee,
            type: 'select',
            options: guarantee_options_for_select,
            klass: 'select2 search-input-text',
            style: 'width: 100%',
            data: { column: 10 }
          }
        }
      ]
    end

    def sort_columns
      ['calls.id', 'calls.call_date', 'calls.username', 'calls.phone', 'calls.adress', 'product_models.name', 'calls.error', 'masters.name', 'calls.created_at', 'calls.status', 'calls.guarantee']
    end

    def guarantee_options_for_select
      [['Не выбрано', ''], ['Да', true], ['Нет', false]]
    end

    def status_options_for_select
      [['Не выбрано', ''], ['Ожидает', 'expect'], ['В процессе', 'in_progress'], ['Отменен', 'canceled'], ['Выполнен', 'success']]
    end
  end
end
