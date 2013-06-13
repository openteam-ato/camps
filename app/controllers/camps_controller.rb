# encoding: utf-8

require 'prawn'

class CampsController < MainController
  include ActionView::Helpers::NumberHelper

  def index
    @camps = Camp.sunspot_search(params).results

    super
  end

  def show
    @camp = Camp.find(params[:id])
    raise ActionController::RoutingError.new('Not Found') if @camp.blank?
    super
  end

  def register
    pdf = Prawn::Document.new
    pdf.font_families.update(
      'Verdana' => {
        :normal => '/Library/Fonts/Verdana.ttf'
      }
    )
    pdf.font 'Verdana', :size => 8

    Camp.kind.values.each do |kind|
      pdf.outline.section(I18n.t(kind, :scope => :kinds), :destination => pdf.page_number)
      pdf.text(I18n.t(kind, :scope => :kinds), :align => :center, :size => 16)
      pdf.move_down(20)
      Camp.with_kind(kind).each do |camp|
        pdf.outline.add_subsection_to(I18n.t(kind, :scope => :kinds)) do
          pdf.outline.section(camp.to_s, :destination => pdf.page_number)
        end
        pdf.text(camp.to_s, :align => :center, :size => 12)
        pdf.move_down(10)

        if camp.photos.any?
          height_image_box = 0
          height_desc_box = 0
          pdf.bounding_box([0, pdf.cursor], :width => 200) do
            pdf.image(open(camp.photos.first.image_url), :position => :left, :fit => [200, 200])
            height_image_box = pdf.bounds.height
          end
          pdf.bounding_box([210, pdf.cursor + height_image_box], :width => 280) do
            pdf.text(camp.description, :size => 10, :leading => 3)
            height_desc_box = pdf.bounds.height
          end
          delta = height_desc_box - height_image_box
          if delta < 0
            pdf.move_down(delta.abs)
          end
        else
          pdf.text(camp.description, :size => 10, :leading => 3)
        end

        pdf.move_down(10)
        pdf.text('Адрес: ' + camp.address.to_s)
        pdf.move_down(5)
        pdf.text('Тел.: ' + camp.phones.join(', '))
        pdf.move_down(5)
        camp.links.each do |link|
          pdf.text((link.title + ': ' + (link.email? ? view_context.mail_to(link.url) : view_context.link_to(link.url, link.url))), :inline_format => true)
          pdf.move_down(5)
        end
        if camp.employees.any?
          pdf.move_down(5)
          pdf.text('Персонал', :size => 10)
          pdf.move_down(10)
          camp.employees.each do |employee|
            pdf.text(employee.to_s)
            pdf.move_down(5)
          end
          pdf.move_down(5)
        end
        if camp.shifts.any?
          pdf.text('Смены', :size => 10)
          pdf.move_down(10)
          camp.shifts.each do |season|
            pdf.text(season.title)
            pdf.move_down(5)
            pdf.text("Смена с #{I18n.l(season.starts_on, :format => :long)} по #{I18n.l(season.ends_on, :format => :long)}, для детей #{season.age_min}–#{season.age_max} лет, стоимость путевки — #{season.price_max? ? "#{number_to_currency(season.price_min, :unit => '')}– #{number_to_currency(season.price_max)}" : number_to_currency(season.price_min)}")
            pdf.move_down(10)
          end
          pdf.move_down(10)
        end
      end
      pdf.start_new_page unless kind == Camp.kind.values.last
    end

    send_data pdf.render, :type => 'application/pdf', :disposition => "inline", :filename => "Реестр лагерей #{Time.zone.now.strftime("%d.%m.%Y")}.pdf"
  end

  alias_method :template, :action_name
end
