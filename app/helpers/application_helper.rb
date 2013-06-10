# encoding: utf-8

module ApplicationHelper
  def render_partial_for_region(region)
    if region && (region.response_status == 200 || !region.response_status?)
      render :partial => "regions/#{region.template}",
      :locals => { :object => region.content, :response_status => region.response_status }
    else
      render :partial => 'regions/error', :locals => { :region => region }
    end
  end

  def render_navigation(hash, exclude_first = false)
    return '' if hash.nil? || hash.empty?

    if exclude_first
      hash.map do |key, value|
        render_navigation(value['children'])
      end.join.html_safe
    else
      content_tag :ul do
        hash.map do |key, value|
          content_tag :li, :class => value['selected'] ? 'selected' : nil do
            link_to(value['title'], value['path']) + render_navigation(value['children'])
          end
        end.join.html_safe
      end
    end
  end

  def image_url(url, width, height)
    url.gsub(/(?!=\/files\/\d+\/)(\d+-\d+.?.?)(?=\/)/, "#{width}-#{height}!")
  end
end
