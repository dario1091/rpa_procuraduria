# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_24_121050) do

  create_table "Informacion_Fraudes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "Cedula"
    t.string "Nombre", limit: 37
    t.float "Telefono", limit: 53
    t.string "Correo", limit: 37
    t.string "Empresa", limit: 14
  end

  create_table "archivos_procesados", primary_key: "arp_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "emp_id"
    t.integer "fni_id", null: false
    t.integer "arp_quincena"
    t.timestamp "arp_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["emp_id"], name: "archivos_procesados_FK"
    t.index ["fni_id"], name: "archivos_procesados_FK_1"
  end

  create_table "auxiliar_maestro", primary_key: "aum_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "emp_id"
    t.string "aum_empresa", limit: 50
    t.string "aum_scoring", limit: 15
    t.string "aum_estado", limit: 15
    t.string "aum_cedula", limit: 20
    t.string "aum_nombre", limit: 120
    t.string "aum_correo", limit: 180
    t.string "aum_celular", limit: 80
    t.string "aum_direccion", limit: 200
    t.string "aum_validacion_correo", limit: 30
    t.date "aum_fecha_creacion"
    t.date "aum_fecha_actualizacion"
    t.string "aum_envio_informacion", limit: 20
    t.date "aum_ultima_solicitud"
    t.date "aum_ultimo_desembolso"
    t.string "aum_saldo_cartera", limit: 15
    t.string "aum_bloqueo_cartera", limit: 20
  end

  create_table "bancos", primary_key: "ban_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ban_codigo", limit: 5, null: false
    t.string "ban_nombre", limit: 60, null: false
    t.timestamp "ban_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "bloqueo_avanzo", primary_key: "bla_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "bla_descrpcion", limit: 20
    t.timestamp "bla_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "celular_cliente", primary_key: "clc_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "cli_id", null: false
    t.integer "dtc_id", null: false
    t.integer "fni_id"
    t.string "clc_numero", limit: 15
    t.date "clc_primer_reporte"
    t.date "clc_ultimo_reporte"
    t.integer "clc_numero_reportes"
    t.boolean "clc_verificado"
    t.boolean "clc_bloqueado"
    t.timestamp "dtc_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["cli_id"], name: "fk_celular_cliente"
    t.index ["dtc_id"], name: "fk_celular_cliente_datos_cargados1_idx"
    t.index ["fni_id"], name: "fk_celular_cliente_fuente_informacion"
  end

  create_table "cliente_respaldo", primary_key: "cli_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "dtc_id", null: false
    t.integer "fni_id"
    t.integer "tpd_id", null: false
    t.string "cli_cedula", limit: 20, null: false
    t.string "cli_nombre1", limit: 50
    t.string "cli_nombre2", limit: 55
    t.string "cli_apellido1", limit: 50
    t.string "cli_apellido2", limit: 50
    t.date "cli_fecha_nacimiento"
    t.integer "cnt_id", default: 1, null: false
    t.timestamp "cli_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "bla_id"
    t.string "cli_rango_edad", limit: 20
    t.index ["bla_id"], name: "FK_cliente_bloqueo"
    t.index ["cnt_id"], name: "FK_cliente_contactar"
    t.index ["dtc_id"], name: "fk_cliente_datos_cargados"
    t.index ["fni_id"], name: "fk_cliente_fuente_informacion"
    t.index ["tpd_id"], name: "fk_cliente_idx"
  end

  create_table "clientes", primary_key: "cli_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "dtc_id", null: false
    t.integer "fni_id"
    t.integer "tpd_id", null: false
    t.string "cli_cedula", limit: 20, null: false
    t.string "cli_nombre1", limit: 50
    t.string "cli_nombre2", limit: 55
    t.string "cli_apellido1", limit: 50
    t.string "cli_apellido2", limit: 50
    t.date "cli_fecha_nacimiento"
    t.integer "cnt_id", default: 1, null: false
    t.timestamp "cli_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "bla_id"
    t.string "cli_rango_edad", limit: 20
    t.index ["bla_id"], name: "FK_cliente_bloqueo"
    t.index ["cnt_id"], name: "FK_cliente_contactar"
    t.index ["dtc_id"], name: "fk_cliente_datos_cargados"
    t.index ["fni_id"], name: "fk_cliente_fuente_informacion"
    t.index ["tpd_id"], name: "fk_cliente_idx"
  end

  create_table "contactar", primary_key: "cnt_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cnt_descripcion", limit: 20
    t.timestamp "cnt_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "correo_cliente", primary_key: "crc_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "cli_id", null: false
    t.integer "dtc_id", null: false
    t.integer "fni_id", null: false
    t.string "crc_correo", limit: 100
    t.date "crc_primer_reporte"
    t.date "crc_ultimo_reporte"
    t.integer "crc_numero_reportes"
    t.boolean "crc_verificado"
    t.boolean "crc_bloqueado"
    t.timestamp "crc_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["cli_id"], name: "fk_correro_cliente_idx"
    t.index ["dtc_id"], name: "fk_correro_cliente_datos_cargados1_idx"
    t.index ["fni_id"], name: "fk_correro_cliente_fuente_informacion"
  end

  create_table "cuentas_cliente", primary_key: "cuc_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "cli_id"
    t.integer "dtc_id"
    t.integer "fni_id"
    t.integer "ban_id"
    t.integer "tpc_id"
    t.string "tpc_num_cuenta", limit: 30
    t.timestamp "tpc_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["ban_id"], name: "FK_cuentas_cliente_bancos"
    t.index ["cli_id"], name: "FK_cuentas_cliente_cliente"
    t.index ["dtc_id"], name: "FK_cuentas_cliente_datos_cargados"
    t.index ["fni_id"], name: "FK_cuentas_cliente_fuente_informacion"
    t.index ["tpc_id"], name: "FK_cuentas_cliente_tipo_cuenta"
  end

  create_table "datos_cargados", primary_key: "dtc_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "emp_id", null: false
    t.integer "fni_id"
    t.string "dtc_cedula_cliente", limit: 20, null: false
    t.string "dtc_nombre_completo", limit: 150
    t.string "dtc_celular_cliente", limit: 15
    t.string "dtc_correo_cliente", limit: 100
    t.string "dtc_direccion_cliente", limit: 150
    t.date "dtc_fecha_nacimiento_cliente"
    t.integer "dtc_activo", limit: 1, default: 1, null: false
    t.date "dtc_fecha_ingreso"
    t.date "dtc_fecha_retiro"
    t.decimal "dtc_salario", precision: 10, default: "0"
    t.timestamp "dtc_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "dtc_scoring", limit: 1
    t.float "dtc_monto_scoring", limit: 53
    t.string "dtc_telefono_fijo", limit: 15
    t.index ["emp_id"], name: "fk_datos_empresa_idx"
    t.index ["fni_id"], name: "fk_datos_fuente_idx"
  end

  create_table "direccion_cliente", primary_key: "drc_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "cli_id"
    t.integer "dtc_id", null: false
    t.integer "fni_id", null: false
    t.string "drc_direccion", limit: 150
    t.date "drc_primer_reporte"
    t.date "drc_ultimo_reporte"
    t.integer "drc_numero_reportes"
    t.boolean "drc_verificado"
    t.boolean "drc_bloqueado"
    t.timestamp "drc_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["cli_id"], name: "fk_direccion_cliente_idx"
    t.index ["dtc_id"], name: "fk_direccion_cliente_datos_cargados1_idx"
    t.index ["fni_id"], name: "fk_direccion_cliente_fuente_informacion"
  end

  create_table "empleador", primary_key: "epl_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "cli_id", null: false
    t.integer "emp_id", null: false
    t.integer "dtc_id", null: false
    t.integer "fni_id"
    t.integer "fni_id_modificacion"
    t.date "epl_fecha_ingreso"
    t.date "epl_fecha_retiro"
    t.decimal "epl_salario", precision: 10, default: "0", null: false
    t.integer "epl_activo", limit: 1, default: 1
    t.timestamp "epl_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "epl_scoring", limit: 1
    t.float "epl_monto_scoring", limit: 53
    t.index ["cli_id"], name: "fk_empleador_empleado_idx"
    t.index ["dtc_id"], name: "fk_empleador_datos_cargados_idx"
    t.index ["emp_id"], name: "fk_empleador_empresa_idx"
    t.index ["fni_id"], name: "fk_empleador_fuente_informacion"
    t.index ["fni_id_modificacion"], name: "fk_empleador_fuente_informacion2"
  end

  create_table "empresa", primary_key: "emp_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "emp_nombre_empresa", limit: 100, null: false
    t.timestamp "emp_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "fijo_cliente", primary_key: "fjc_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "cli_id"
    t.integer "dtc_id"
    t.integer "fni_id"
    t.string "fjc_numero", limit: 15
    t.date "fjc_primer_reporte"
    t.date "fjc_ultimo_reporte"
    t.integer "fjc_numero_reportes"
    t.string "fjc_ciudad", limit: 80
    t.boolean "fjc_condicion"
    t.index ["cli_id"], name: "fijo_cliente_FK"
    t.index ["dtc_id"], name: "fijo_cliente_FK_1"
    t.index ["fni_id"], name: "fijo_cliente_FK_2"
  end

  create_table "fuente_informacion", primary_key: "fni_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "fni_origen_datos", limit: 250, null: false
    t.integer "fni_cantidad_registros"
    t.date "fni_fecha_reporte", null: false
    t.timestamp "fni_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "maestra", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "Column1"
    t.integer "id"
    t.integer "id2"
    t.string "EMPRESA", limit: 50
    t.string "Scoring", limit: 15
    t.string "Estado", limit: 15
    t.string "num_identificacion", limit: 20
    t.string "Nombres", limit: 120
    t.string "Correo", limit: 80
    t.string "Celular", limit: 80
    t.string "Ciudad/Municipio", limit: 200
    t.string "Validacion correo", limit: 30
    t.string "Fecha Creacion", limit: 10
    t.string "Fecha Ultima Actualizacion", limit: 10
    t.string "NO ENVIO INFORMACION", limit: 20
    t.string "Ultima Solicitud", limit: 10
    t.date "Ultimo Desembolso"
    t.string "Saldo Cartera", limit: 20
    t.string "Bloqueo Cartera", limit: 20
  end

  create_table "tipo_cuenta", primary_key: "tpc_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tpc_descripcion", limit: 20
    t.timestamp "tpc_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "tipo_documento", primary_key: "tpd_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tpd_descripcion", limit: 100
    t.timestamp "tpd_fecha_creacion", default: -> { "CURRENT_TIMESTAMP" }
  end

  add_foreign_key "archivos_procesados", "empresa", column: "emp_id", primary_key: "emp_id", name: "archivos_procesados_FK"
  add_foreign_key "archivos_procesados", "fuente_informacion", column: "fni_id", primary_key: "fni_id", name: "archivos_procesados_FK_1"
  add_foreign_key "celular_cliente", "clientes", column: "cli_id", primary_key: "cli_id", name: "fk_celular_cliente"
  add_foreign_key "celular_cliente", "datos_cargados", column: "dtc_id", primary_key: "dtc_id", name: "fk_celular_cliente_datos_cargados"
  add_foreign_key "celular_cliente", "fuente_informacion", column: "fni_id", primary_key: "fni_id", name: "fk_celular_cliente_fuente_informacion"
  add_foreign_key "clientes", "bloqueo_avanzo", column: "bla_id", primary_key: "bla_id", name: "FK_cliente_bloqueo"
  add_foreign_key "clientes", "contactar", column: "cnt_id", primary_key: "cnt_id", name: "FK_cliente_contactar"
  add_foreign_key "clientes", "datos_cargados", column: "dtc_id", primary_key: "dtc_id", name: "fk_cliente_datos_cargados"
  add_foreign_key "clientes", "fuente_informacion", column: "fni_id", primary_key: "fni_id", name: "fk_cliente_fuente_informacion"
  add_foreign_key "clientes", "tipo_documento", column: "tpd_id", primary_key: "tpd_id", name: "fk_cliente"
  add_foreign_key "correo_cliente", "clientes", column: "cli_id", primary_key: "cli_id", name: "fk_correro_cliente"
  add_foreign_key "correo_cliente", "datos_cargados", column: "dtc_id", primary_key: "dtc_id", name: "fk_correro_cliente_datos_cargados"
  add_foreign_key "correo_cliente", "fuente_informacion", column: "fni_id", primary_key: "fni_id", name: "fk_correro_cliente_fuente_informacion"
  add_foreign_key "cuentas_cliente", "bancos", column: "ban_id", primary_key: "ban_id", name: "FK_cuentas_cliente_bancos"
  add_foreign_key "cuentas_cliente", "clientes", column: "cli_id", primary_key: "cli_id", name: "FK_cuentas_cliente_cliente"
  add_foreign_key "cuentas_cliente", "datos_cargados", column: "dtc_id", primary_key: "dtc_id", name: "FK_cuentas_cliente_datos_cargados"
  add_foreign_key "cuentas_cliente", "fuente_informacion", column: "fni_id", primary_key: "fni_id", name: "FK_cuentas_cliente_fuente_informacion"
  add_foreign_key "cuentas_cliente", "tipo_cuenta", column: "tpc_id", primary_key: "tpc_id", name: "FK_cuentas_cliente_tipo_cuenta"
  add_foreign_key "datos_cargados", "empresa", column: "emp_id", primary_key: "emp_id", name: "fk_datos_empresa"
  add_foreign_key "datos_cargados", "fuente_informacion", column: "fni_id", primary_key: "fni_id", name: "fk_datos_fuente"
  add_foreign_key "direccion_cliente", "clientes", column: "cli_id", primary_key: "cli_id", name: "fk_direccion_cliente"
  add_foreign_key "direccion_cliente", "datos_cargados", column: "dtc_id", primary_key: "dtc_id", name: "fk_direccion_cliente_datos_cargados"
  add_foreign_key "direccion_cliente", "fuente_informacion", column: "fni_id", primary_key: "fni_id", name: "fk_direccion_cliente_fuente_informacion"
  add_foreign_key "empleador", "clientes", column: "cli_id", primary_key: "cli_id", name: "fk_empleador_empleado"
  add_foreign_key "empleador", "datos_cargados", column: "dtc_id", primary_key: "dtc_id", name: "fk_empleador_datos_cargados"
  add_foreign_key "empleador", "empresa", column: "emp_id", primary_key: "emp_id", name: "fk_empleador_empresa"
  add_foreign_key "empleador", "fuente_informacion", column: "fni_id", primary_key: "fni_id", name: "fk_empleador_fuente_informacion"
  add_foreign_key "empleador", "fuente_informacion", column: "fni_id_modificacion", primary_key: "fni_id", name: "fk_empleador_fuente_informacion2"
  add_foreign_key "fijo_cliente", "clientes", column: "cli_id", primary_key: "cli_id", name: "fijo_cliente_FK"
  add_foreign_key "fijo_cliente", "datos_cargados", column: "dtc_id", primary_key: "dtc_id", name: "fijo_cliente_FK_1"
  add_foreign_key "fijo_cliente", "fuente_informacion", column: "fni_id", primary_key: "fni_id", name: "fijo_cliente_FK_2"
end
