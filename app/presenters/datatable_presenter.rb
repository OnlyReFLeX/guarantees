class DatatablePresenter < Keynote::Presenter
  def human_datetime(date, format = '%Y-%m-%d %H:%M')
    date&.strftime(format)
  end
end
