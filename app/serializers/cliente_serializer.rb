class ClienteSerializer < ActiveModel::Serializer
  attributes :id, :cli_cedula, :cli_nombre1, :cli_nombre2, :cli_apellido1, :cli_apellido2, :cli_fecha_nacimiento, :cli_fecha_creacion, :cli_rango_edad
  # has_one :dtc
  # has_one :fni
  # has_one :tpd
  # has_one :cnt
  # has_one :bla
end
