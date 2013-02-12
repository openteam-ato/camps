#encoding: utf-8

class RequestMailer < ActionMailer::Base
  default :from => Settings['mail']['from']

  def send_email(request)
    @request = request
    mail(:to => Settings['mail']['to'], :subject => 'Вопрос c сайта')
  end
end
