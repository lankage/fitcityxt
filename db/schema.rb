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

ActiveRecord::Schema.define(version: 20180531211207) do

  create_table "custom_target_submissions", force: :cascade do |t|
    t.text     "sequence"
    t.string   "pam_sequence"
    t.integer  "spacer_length"
    t.string   "target_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "created_by"
    t.string   "genome"
    t.text     "target_name"
  end

  create_table "genes", force: :cascade do |t|
    t.string   "name"
    t.text     "nucleotide_sequence"
    t.text     "amino_acid_sequence"
    t.text     "description"
    t.string   "genome"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "start_pos"
    t.integer  "end_pos"
    t.string   "chrom"
    t.boolean  "has_intron"
    t.boolean  "has_5_utr"
  end

  create_table "offsite_hits", force: :cascade do |t|
    t.string   "sgrna_sequence"
    t.integer  "offsite_search_id"
    t.string   "chrom"
    t.integer  "pos"
    t.string   "strand"
    t.integer  "mismatches"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
  end

  create_table "offsite_searches", force: :cascade do |t|
    t.string   "sgrna_sequence"
    t.string   "genome"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "pam_sequence"
  end

  create_table "results", force: :cascade do |t|
    t.integer  "gene_id"
    t.string   "sgrna_sequence"
    t.float    "perc_activity"
    t.string   "chrom"
    t.integer  "pos"
    t.string   "mismatch_seq"
    t.string   "strand"
    t.integer  "num_mis_matches"
    t.integer  "num_off_site_match"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "submission_id"
    t.string   "gc"
    t.text     "strain_coverage"
    t.string   "state"
    t.string   "name"
    t.integer  "ct_submission_id"
    t.string   "runoutput_type"
    t.integer  "runoutput_id"
    t.integer  "pos_in_gene"
    t.text     "comments"
    t.integer  "strains_covered"
    t.index ["runoutput_type", "runoutput_id"], name: "index_results_on_runoutput_type_and_runoutput_id"
  end

  create_table "strains", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "vcf_file"
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "gene_id"
    t.string   "pam_sequence"
    t.integer  "spacer_length"
    t.integer  "strain_id"
    t.string   "target_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "created_by"
  end

  create_table "targets", force: :cascade do |t|
    t.string   "name"
    t.text     "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "display_name"
    t.boolean  "ldap"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
