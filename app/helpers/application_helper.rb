module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_messages', :locals => {:object => object})
  end

  def sortable (criteria, title = nil)
    title ||= criteria.titleize
    direction = criteria == sort_criteria && sort_direction == 'ASC' ? 'DESC' : "ASC"
    link_to title, params.merge(:sort => criteria, :direction => direction, :page => nil).permit(:search, :sort, :direction, :page)
  end

  def status_tag(boolean, options={})
    options[:true_text] ||=''
    options[:false_text] ||=''

    if boolean
      content_tag(:span, options[:true_text], :class => 'status true')
    else
      content_tag(:span, options[:false_text], :class => 'status false')
    end
  end
end
