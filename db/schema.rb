# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151118061501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "actividads", force: :cascade do |t|
    t.integer  "autorizado"
    t.string   "nombre"
    t.string   "nombremodulo"
    t.text     "descripcion"
    t.float    "duracionhoras"
    t.integer  "numerosesiones"
    t.string   "objetivoespecifico"
    t.string   "objetivogeneral"
    t.string   "materialdidactico"
    t.text     "dias"
    t.string   "horario"
    t.string   "aula"
    t.text     "duracion"
    t.string   "fechainicio"
    t.date     "fechafinal"
    t.string   "cupomaximo"
    t.integer  "cupominimo"
    t.text     "metas"
    t.float    "costogeneral"
    t.float    "costoalumnos"
    t.text     "materialesparaalumnos"
    t.text     "materialesdealumnos"
    t.integer  "idponente"
    t.integer  "idtipo"
    t.integer  "idmodalidad"
    t.integer  "idareaacademica"
    t.integer  "idmateria"
    t.integer  "iddisciplina"
    t.integer  "idpublicodirigido"
    t.integer  "idsede"
    t.text     "evaluacion"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "area_academicas", force: :cascade do |t|
    t.text     "nombrearea"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areas_especializacions", force: :cascade do |t|
    t.string   "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "asesorias_impartidas", force: :cascade do |t|
    t.text     "nombre_asesorias_impartidas"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "cargo_academico_admins", force: :cascade do |t|
    t.text     "nombre_cargo_academico_admin"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "cargo_academicos", force: :cascade do |t|
    t.text     "nombre_cargo_academico"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "conferencia", force: :cascade do |t|
    t.text     "nombre_conferencia"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "congresos", force: :cascade do |t|
    t.text     "nombre_congreso"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "contenidos", force: :cascade do |t|
    t.integer  "actividad_id"
    t.integer  "numerotema"
    t.text     "tema"
    t.integer  "numerohoras"
    t.text     "nombreponente"
    t.date     "fechainicio"
    t.date     "fechafinal"
    t.text     "subtemas"
    t.text     "bibliografia"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "contenidos", ["actividad_id"], name: "index_contenidos_on_actividad_id", using: :btree

  create_table "correo_curriculums", force: :cascade do |t|
    t.string   "correo"
    t.string   "publicacion",         default: "t"
    t.integer  "curriculum_vitae_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "correo_curriculums", ["curriculum_vitae_id"], name: "index_correo_curriculums_on_curriculum_vitae_id", using: :btree

  create_table "curriculum_vitaes", force: :cascade do |t|
    t.string   "rfc"
    t.string   "nombre"
    t.string   "apmaterno"
    t.string   "appaterno"
    t.date     "fecha_nacimiento"
    t.integer  "numero"
    t.string   "calle"
    t.string   "colonia"
    t.string   "delegacion",               default: "?"
    t.string   "ciudad"
    t.integer  "cp"
    t.string   "institucion"
    t.integer  "areas_especializacion_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "curriculum_vitaes", ["areas_especializacion_id"], name: "index_curriculum_vitaes_on_areas_especializacion_id", using: :btree

  create_table "curso_de_actualizacions", force: :cascade do |t|
    t.string   "nombre_curso"
    t.integer  "formacion_academica_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "curso_de_actualizacions", ["formacion_academica_id"], name: "index_curso_de_actualizacions_on_formacion_academica_id", using: :btree

  create_table "cursos_impartidos", force: :cascade do |t|
    t.text     "nombre_cursos_impartidos"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "direccion_teses", force: :cascade do |t|
    t.text     "nombre_cursos_impartidos"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "disciplinas", force: :cascade do |t|
    t.text     "nombredisciplina"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.text     "nombre_empresa"
    t.integer  "id_experiencia_profesional"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "entidad_academicas", force: :cascade do |t|
    t.text     "nombre_entidad_academica"
    t.integer  "id_experiencia_profesional"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "experiencia_academicas", force: :cascade do |t|
    t.integer  "id_curriculum_vitae"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "experiencia_docentes", force: :cascade do |t|
    t.text     "nombre_experiencia_docente"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "experiencia_profesionals", force: :cascade do |t|
    t.string   "entidad"
    t.text     "experiencia"
    t.integer  "curriculum_vitae_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "experiencia_profesionals", ["curriculum_vitae_id"], name: "index_experiencia_profesionals_on_curriculum_vitae_id", using: :btree

  create_table "formacion_academicas", force: :cascade do |t|
    t.string   "area_especialidad"
    t.string   "ultimo_grado"
    t.integer  "año"
    t.string   "entidad_academica"
    t.integer  "curriculum_vitae_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "formacion_academicas", ["curriculum_vitae_id"], name: "index_formacion_academicas_on_curriculum_vitae_id", using: :btree

  create_table "materia", force: :cascade do |t|
    t.text     "nombremateria"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "modalidads", force: :cascade do |t|
    t.text     "nombremodalidad"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "ponencia", force: :cascade do |t|
    t.text     "nombre_ponencias"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "ponentes", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nombreusuario"
    t.integer  "curriculum_vitae_id"
    t.decimal  "salario"
  end

  add_index "ponentes", ["curriculum_vitae_id"], name: "index_ponentes_on_curriculum_vitae_id", using: :btree
  add_index "ponentes", ["email"], name: "index_ponentes_on_email", unique: true, using: :btree
  add_index "ponentes", ["nombreusuario"], name: "index_ponentes_on_nombreusuario", unique: true, using: :btree
  add_index "ponentes", ["reset_password_token"], name: "index_ponentes_on_reset_password_token", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prueba", force: :cascade do |t|
    t.string "algo", limit: 20
  end

  create_table "publicaciones", force: :cascade do |t|
    t.text     "nombre_publicaciones"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "publico_dirigidos", force: :cascade do |t|
    t.text     "nombrepublico"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reconocimientos", force: :cascade do |t|
    t.string   "nombre_reconocimiento"
    t.integer  "curriculum_vitae_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "reconocimientos", ["curriculum_vitae_id"], name: "index_reconocimientos_on_curriculum_vitae_id", using: :btree

  create_table "registrars", force: :cascade do |t|
    t.integer  "idactividad"
    t.integer  "idinteresado"
    t.text     "nombreactividad"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "requisitos_egresos", force: :cascade do |t|
    t.text     "nombrerequisitosegreso"
    t.integer  "idponente"
    t.integer  "idactividad"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "requisitos_ingresos", force: :cascade do |t|
    t.text     "nombrerequisitosingreso"
    t.integer  "idponente"
    t.string   "idactividad"
    t.string   "integer"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "requisitos_permanencia", force: :cascade do |t|
    t.text     "nombrerequisitospermanencia"
    t.integer  "idponente"
    t.integer  "idactividad"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "revisor_de_teses", force: :cascade do |t|
    t.text     "nombre_revisor_de_tesis"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "sedes", force: :cascade do |t|
    t.text     "nombresede"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telefono_curriculums", force: :cascade do |t|
    t.string   "num_telefono"
    t.integer  "curriculum_vitae_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "telefono_curriculums", ["curriculum_vitae_id"], name: "index_telefono_curriculums_on_curriculum_vitae_id", using: :btree

  create_table "tipos", force: :cascade do |t|
    t.text     "nombretipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutorias_impartidas", force: :cascade do |t|
    t.text     "nombre_tutorias_impartidas"
    t.integer  "id_experiencia_academica"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "usuarios", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nombre"
    t.string   "appaterno"
    t.string   "apmaterno"
    t.string   "institucion"
    t.string   "numerodecuenta"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["numerodecuenta"], name: "index_usuarios_on_numerodecuenta", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "contenidos", "actividads"
  add_foreign_key "curriculum_vitaes", "areas_especializacions"
  add_foreign_key "curso_de_actualizacions", "formacion_academicas"
  add_foreign_key "formacion_academicas", "curriculum_vitaes"
  add_foreign_key "ponentes", "curriculum_vitaes"
  add_foreign_key "reconocimientos", "curriculum_vitaes"
end
