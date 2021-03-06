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

ActiveRecord::Schema.define(version: 20170418003857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "puesto"
    t.string   "extension"
    t.string   "consejo"
    t.string   "oficina"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "alumnos", id: false, force: :cascade do |t|
    t.integer  "grupo_id"
    t.string   "correoElectronico"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "celular"
    t.integer  "semestre"
    t.string   "carrera"
    t.string   "matricula"
    t.date     "fechaInicio"
    t.date     "fechaFin"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["grupo_id"], name: "index_alumnos_on_grupo_id", using: :btree
  end

  create_table "avisos", force: :cascade do |t|
    t.integer  "evento_id"
    t.integer  "grupo_id"
    t.string   "mensaje"
    t.string   "departamento"
    t.string   "remitente"
    t.string   "consejo"
    t.string   "titulo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["evento_id"], name: "index_avisos_on_evento_id", using: :btree
    t.index ["grupo_id"], name: "index_avisos_on_grupo_id", using: :btree
  end

  create_table "eventos", id: false, force: :cascade do |t|
    t.integer  "grupo_id"
    t.integer  "folio",                      null: false
    t.string   "nombre"
    t.string   "descripcion"
    t.boolean  "aprobadoMercadotecnia"
    t.boolean  "aprobadoConsejo"
    t.boolean  "aprobadoLogistica"
    t.boolean  "aprobadoFinanzas"
    t.string   "nombreAprobadoConsejo"
    t.string   "nombreAprobadoLogistica"
    t.string   "nombreAprobadoFinanzas"
    t.datetime "fechaAprobadoConsejo"
    t.datetime "fechaAprobadoLogistica"
    t.datetime "fechaAprobadoFinanzas"
    t.boolean  "materiales"
    t.boolean  "audiovisual"
    t.boolean  "revisadoAlimentos"
    t.boolean  "revisadoSeguridad"
    t.integer  "sede_id"
    t.datetime "fechaFin"
    t.datetime "fechaInicio"
    t.integer  "numAsistentes"
    t.time     "horaInauguracion"
    t.string   "estatus"
    t.string   "tipoEvento"
    t.string   "archivoCroquis"
    t.string   "archivoContactosElectricos"
    t.string   "archivoMercadotecnia"
    t.string   "archivoPresupuesto"
    t.string   "archivoAlimentos"
    t.string   "archivoAsistentes"
    t.string   "archivoVip"
    t.string   "archivoCartaContenido"
    t.string   "archivoCartaAsesor"
    t.string   "archivoConsejoOtro"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["folio"], name: "index_eventos_on_folio", unique: true, using: :btree
    t.index ["grupo_id"], name: "index_eventos_on_grupo_id", using: :btree
  end

  create_table "grupos", force: :cascade do |t|
    t.integer  "evento_id"
    t.integer  "grupo_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "nombre"
    t.string   "cuentaBanco"
    t.string   "consejo"
    t.boolean  "activo"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_grupos_on_email", unique: true, using: :btree
    t.index ["evento_id"], name: "index_grupos_on_evento_id", using: :btree
    t.index ["grupo_id"], name: "index_grupos_on_grupo_id", using: :btree
    t.index ["reset_password_token"], name: "index_grupos_on_reset_password_token", unique: true, using: :btree
  end

  create_table "persona_tecs", id: false, force: :cascade do |t|
    t.integer  "grupo_id"
    t.string   "nomina"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "puesto"
    t.string   "telefono"
    t.string   "correoElectronico"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["grupo_id"], name: "index_persona_tecs_on_grupo_id", using: :btree
  end

  create_table "reservas", force: :cascade do |t|
    t.integer  "ubicacion_id"
    t.integer  "evento_id"
    t.datetime "inicio"
    t.datetime "fin"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["evento_id"], name: "index_reservas_on_evento_id", using: :btree
    t.index ["ubicacion_id"], name: "index_reservas_on_ubicacion_id", using: :btree
  end

  create_table "ubicacions", force: :cascade do |t|
    t.string   "zona"
    t.string   "nombre"
    t.integer  "codigo"
    t.integer  "capacidad"
    t.float    "ancho"
    t.float    "alto"
    t.time     "horario_inicio"
    t.time     "horario_fin"
    t.string   "croquis"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
