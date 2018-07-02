require 'will_paginate/view_helpers/action_view'
require 'will_paginate/view_helpers/link_renderer'

module BootstrapPaginationHelper
  class LinkRenderer < WillPaginate::ActionView::LinkRenderer
    protected

      def page_number(page)
        if page == current_page
          link(page, "#", :class => 'active')
        else
          link(page, page, :rel => rel_value(page))
        end
      end

      def gap
        text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
        %(<li class="disabled"><a>#{text}</a></li>)
      end

      def next_page
        num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
        previous_or_next_page(num, @options[:next_label])
      end

      def previous_page
        num = (@collection.current_page - 1 > 0) && @collection.current_page - 1
        previous_or_next_page(num, @options[:previous_label])
      end

      def previous_or_next_page(page, text)
        if page
          link(text, page)
        else
          link(text, "#")
        end
      end

      def html_container(html)
        tag(:ul, html, class: "pagination")
      end

    private

    def link(text, target, attributes = {})
      if target.is_a? Fixnum
        attributes[:rel] = rel_value(target)
        target = url(target)
      end

      unless target == "#"
        attributes[:href] = target
      end

      attributes[:class] ||= ''
      classname = attributes[:class]
      tag(:li, tag(:a, text, attributes), :class => classname + ' waves-effect')
    end
  end
end
