#encoding: utf-8

class RequestsController < MainController
  def new
    @request = Request.new()

    super
  end

  def create
    super
    @request = Request.new(params[:request])
    if @request.valid? && verify_recaptcha(:model => @request)
      @request.send_email
      redirect_to new_request_path, :notice => 'Сообщение отправлено успешно, спасибо за обращение.'
    else
      render :new
    end
  end
end
