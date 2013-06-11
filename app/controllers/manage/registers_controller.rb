class Manage::RegistersController < Manage::ApplicationController
  def index
    @registers = Register.all
  end

  def edit
    @register = Register.find(params[:id])
  end

  def update
    @register = Register.find(params[:id])

    if @register.update_attributes(params[:register])
      redirect_to manage_registers_path
    else
      render :edit
    end
  end

  def destroy
    @register = Register.find(params[:id])
    @register.attachment.destroy

    redirect_to manage_registers_path
  end
end
