class DatatableColumnPresenter < Keynote::Presenter
  presents :dc

  def filter_cell
    filter = dc[:filter]

    build_html do
      th class: 'hasinput' do
        if filter
          filter[:type] == 'select' ? add_select(filter) : add_input(filter)
        end
      end
    end
  end

  def cell
    build_html do
      td dc[:title], data: { class: dc[:klass],  width: dc[:width], hide: dc[:hide], orderable: dc[:orderable] }
    end
  end

  private

  def add_input(f)
    input type: f[:type], placeholder: f[:placeholder], class: f[:klass], data: f[:data]
  end

  def add_select(f)
    select data: f[:data], class: f[:klass], style: f[:style] do
      options_for_select(f[:options])
    end
  end
end
