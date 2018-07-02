class MenuPresenter < Keynote::Presenter
  presents :menu

  def show
    build_html { ul { left_menu_entries(send("#{current_user.type.downcase}_menu")) } }
  end

  private

  def user_menu
    [calls_menu_block, warranties_menu_block, exit_menu_block]
  end

  def admin_menu
    [main_menu_block, calls_menu_block, warranties_menu_block, masters_menu_block, boilers_menu_block, users_menu_block, exit_menu_block]
  end

  # Menu blocks

  def main_menu_block
    { href: root_path, content: link_content('home', 'Главная') }
  end

  def calls_menu_block
    {
      href: '#', content: link_content('phone', 'Вызовы'), children: [
        { href: calls_path, content: link_content('list', 'Список вызовов') },
        { href: new_admin_call_path, content: link_content('plus', 'Новый вызов') }
      ]
    }
  end

  def warranties_menu_block
    {
      href: '#', content: link_content('ambulance', 'Гарантийные'), children: [
        { href: warranties_path, content: link_content('list', 'Список гарантийников') },
        { href: new_admin_warranty_path, content: link_content('plus', 'Оформить гарантию') }
      ]
    }
  end

  def users_menu_block
    {
      href: '#', content: link_content('group', 'Пользователи') , children: [
        { href: admin_users_path, content: link_content('list', 'Список пользователей') },
        { href: new_admin_user_path, content: link_content('plus', 'Новый пользователь') },
      ]
    }
  end

  def masters_menu_block
    { href: new_admin_master_path, content: link_content('address-book', 'Мастеры') }
  end

  def boilers_menu_block
    { href: new_admin_boiler_path, content: link_content('fire', 'Модели') }
  end

  def exit_menu_block
    { href: destroy_user_session_path, content: link_content('sign-out', 'Выйти'), method: :delete }
  end

  def link_content(icon, title)
    content_tag(:i, class: "fa fa-lg fa-fw fa-#{icon}") {} +
      content_tag(:span, class: 'menu-item-parent') { title }
  end

  # TODO: should be ref
  def left_menu_entries(entries = [])
    output = ''
    entries.each do |entry|
      children_selected = entry[:children] && entry[:children].any? {|child| current_page?(child[:href]) }
      entry_selected =  current_page?(entry[:href])

      li_class = ''
      li_class += 'open' if children_selected
      li_class += 'active' if entry_selected

      output += content_tag(:li, class: li_class) do
        subentry = ''
        subentry += link_to entry[:href], method: entry[:method] do
          link_text = ''
          link_text += entry[:content].html_safe
          if entry[:children]
            if children_selected
              link_text += '<b class="collapse-sign"><em class="fa fa-minus-square-o"></em></b>'
            else
              link_text += '<b class="collapse-sign"><em class="fa fa-plus-square-o"></em></b>'
            end
          end
          link_text.html_safe
        end

        if entry[:children]
          if children_selected
            ul_style = 'display: block'
          else
            ul_style = ''
          end
          subentry += "<ul style='#{ul_style}'>" + left_menu_entries(entry[:children]) + '</ul>'
        end
        subentry.html_safe
      end
    end
    output.html_safe
  end
end
