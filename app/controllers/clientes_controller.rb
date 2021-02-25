class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :update, :destroy]

  # GET /clientes
  def index
    @clientes = Cliente.all

    render json: @clientes
  end

  # GET /clientes/1
  def show
    render json: @cliente
  end

  # POST /clientes
  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      render json: @cliente, status: :created, location: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clientes/1
  def update
    if @cliente.update(cliente_params)
      render json: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  def update_all_name
    Cliente.update_all_name()
    render :ok
  end

  # DELETE /clientes/1
  def destroy
    @cliente.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cliente_params
    params.require(:cliente).permit(:dtc_id, :fni_id, :tpd_id, :cli_cedula, :cli_nombre1, :cli_nombre2, :cli_apellido1, :cli_apellido2, :cli_fecha_nacimiento, :cnt_id, :cli_fecha_creacion, :bla_id, :cli_rango_edad)
  end
end
