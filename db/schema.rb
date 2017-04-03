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

ActiveRecord::Schema.define(version: 20170402190501) do

  create_table "ahoy_events", force: :cascade do |t|
    t.uuid     "visit_id",   limit: 16
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.text     "properties", limit: 65535
    t.datetime "time"
  end

  add_index "ahoy_events", ["time"], name: "index_ahoy_events_on_time", using: :btree
  add_index "ahoy_events", ["user_id"], name: "index_ahoy_events_on_user_id", using: :btree
  add_index "ahoy_events", ["visit_id"], name: "index_ahoy_events_on_visit_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer  "conference_id", limit: 4
    t.string   "name",          limit: 255
    t.string   "utm_source",    limit: 255
    t.string   "utm_medium",    limit: 255
    t.string   "utm_term",      limit: 255
    t.string   "utm_content",   limit: 255
    t.string   "utm_campaign",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cfps", force: :cascade do |t|
    t.date     "start_date",           null: false
    t.date     "end_date",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id", limit: 4
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50,    default: ""
    t.text     "body",             limit: 65535
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.integer  "user_id",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject",          limit: 255
    t.integer  "parent_id",        limit: 4
    t.integer  "lft",              limit: 4
    t.integer  "rgt",              limit: 4
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "commercials", force: :cascade do |t|
    t.string   "commercial_id",       limit: 255
    t.string   "commercial_type",     limit: 255
    t.integer  "commercialable_id",   limit: 4
    t.string   "commercialable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url",                 limit: 255
  end

  create_table "conferences", force: :cascade do |t|
    t.string   "guid",               limit: 255,                   null: false
    t.string   "title",              limit: 255,                   null: false
    t.string   "short_title",        limit: 255,                   null: false
    t.string   "timezone",           limit: 255,                   null: false
    t.date     "start_date",                                       null: false
    t.date     "end_date",                                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name",     limit: 255
    t.integer  "revision",           limit: 4
    t.boolean  "use_vpositions",                   default: false
    t.boolean  "use_vdays",                        default: false
    t.boolean  "use_volunteers"
    t.string   "color",              limit: 255
    t.text     "events_per_week",    limit: 65535
    t.text     "description",        limit: 65535
    t.integer  "registration_limit", limit: 4,     default: 0
    t.string   "picture",            limit: 255
  end

  create_table "conferences_questions", id: false, force: :cascade do |t|
    t.integer "conference_id", limit: 4
    t.integer "question_id",   limit: 4
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "social_tag",    limit: 255
    t.string   "email",         limit: 255
    t.string   "facebook",      limit: 255
    t.string   "googleplus",    limit: 255
    t.string   "twitter",       limit: 255
    t.string   "instagram",     limit: 255
    t.integer  "conference_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sponsor_email", limit: 255
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "difficulty_levels", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "color",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id",  limit: 4
  end

  create_table "email_settings", force: :cascade do |t|
    t.integer  "conference_id",                                 limit: 4
    t.boolean  "send_on_registration",                                        default: false
    t.boolean  "send_on_accepted",                                            default: false
    t.boolean  "send_on_rejected",                                            default: false
    t.boolean  "send_on_confirmed_without_registration",                      default: false
    t.text     "registration_body",                             limit: 65535
    t.text     "accepted_body",                                 limit: 65535
    t.text     "rejected_body",                                 limit: 65535
    t.text     "confirmed_without_registration_body",           limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registration_subject",                          limit: 255
    t.string   "accepted_subject",                              limit: 255
    t.string   "rejected_subject",                              limit: 255
    t.string   "confirmed_without_registration_subject",        limit: 255
    t.boolean  "send_on_conference_dates_updated",                            default: false
    t.string   "conference_dates_updated_subject",              limit: 255
    t.text     "conference_dates_updated_body",                 limit: 65535
    t.boolean  "send_on_conference_registration_dates_updated",               default: false
    t.string   "conference_registration_dates_updated_subject", limit: 255
    t.text     "conference_registration_dates_updated_body",    limit: 65535
    t.boolean  "send_on_venue_updated",                                       default: false
    t.string   "venue_updated_subject",                         limit: 255
    t.text     "venue_updated_body",                            limit: 65535
    t.boolean  "send_on_cfp_dates_updated",                                   default: false
    t.boolean  "send_on_program_schedule_public",                             default: false
    t.string   "program_schedule_public_subject",               limit: 255
    t.string   "cfp_dates_updated_subject",                     limit: 255
    t.text     "program_schedule_public_body",                  limit: 65535
    t.text     "cfp_dates_updated_body",                        limit: 65535
  end

  create_table "event_schedules", force: :cascade do |t|
    t.integer  "event_id",    limit: 4
    t.integer  "schedule_id", limit: 4
    t.integer  "room_id",     limit: 4
    t.datetime "start_time"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "event_schedules", ["event_id", "schedule_id"], name: "index_event_schedules_on_event_id_and_schedule_id", unique: true, using: :btree
  add_index "event_schedules", ["event_id"], name: "index_event_schedules_on_event_id", using: :btree
  add_index "event_schedules", ["room_id"], name: "index_event_schedules_on_room_id", using: :btree
  add_index "event_schedules", ["schedule_id"], name: "index_event_schedules_on_schedule_id", using: :btree

  create_table "event_types", force: :cascade do |t|
    t.string  "title",                   limit: 255,               null: false
    t.integer "length",                  limit: 4,   default: 30
    t.integer "minimum_abstract_length", limit: 4,   default: 0
    t.integer "maximum_abstract_length", limit: 4,   default: 500
    t.string  "color",                   limit: 255
    t.string  "description",             limit: 255
    t.integer "program_id",              limit: 4
  end

  create_table "event_users", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
    t.string   "event_role", limit: 255, default: "participant", null: false
    t.string   "comment",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "guid",                         limit: 255,                   null: false
    t.integer  "event_type_id",                limit: 4
    t.string   "title",                        limit: 255,                   null: false
    t.string   "subtitle",                     limit: 255
    t.string   "state",                        limit: 255,   default: "new", null: false
    t.string   "progress",                     limit: 255,   default: "new", null: false
    t.string   "language",                     limit: 255
    t.datetime "start_time"
    t.text     "abstract",                     limit: 65535
    t.text     "description",                  limit: 65535
    t.boolean  "public",                                     default: true
    t.text     "proposal_additional_speakers", limit: 65535
    t.integer  "track_id",                     limit: 4
    t.integer  "room_id",                      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "require_registration"
    t.integer  "difficulty_level_id",          limit: 4
    t.integer  "week",                         limit: 4
    t.boolean  "is_highlight",                               default: false
    t.integer  "program_id",                   limit: 4
    t.integer  "max_attendees",                limit: 4
  end

  create_table "events_registrations", force: :cascade do |t|
    t.integer  "registration_id", limit: 4
    t.integer  "event_id",        limit: 4
    t.boolean  "attended",                  default: false, null: false
    t.datetime "created_at"
  end

  create_table "lodgings", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website_link",       limit: 255
    t.integer  "conference_id",      limit: 4
    t.string   "picture",            limit: 255
  end

  create_table "openids", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "email",      limit: 255
    t.string   "uid",        limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: :cascade do |t|
    t.string   "last4",              limit: 255
    t.integer  "amount",             limit: 4
    t.string   "authorization_code", limit: 255
    t.integer  "status",             limit: 4,   default: 0, null: false
    t.integer  "user_id",            limit: 4,               null: false
    t.integer  "conference_id",      limit: 4,               null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "attachment",         limit: 255
  end

  create_table "programs", force: :cascade do |t|
    t.integer  "conference_id",        limit: 4
    t.integer  "rating",               limit: 4,   default: 0
    t.boolean  "schedule_public",                  default: false
    t.boolean  "schedule_fluid",                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "languages",            limit: 255
    t.boolean  "blind_voting",                     default: false
    t.datetime "voting_start_date"
    t.datetime "voting_end_date"
    t.integer  "selected_schedule_id", limit: 4
  end

  add_index "programs", ["selected_schedule_id"], name: "index_programs_on_selected_schedule_id", using: :btree

  create_table "qanswers", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "answer_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qanswers_registrations", id: false, force: :cascade do |t|
    t.integer "registration_id", limit: 4,     null: false
    t.integer "qanswer_id",      limit: 4,     null: false
    t.text    "textarea",        limit: 65535
  end

  create_table "question_types", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.integer  "question_type_id", limit: 4
    t.integer  "conference_id",    limit: 4
    t.boolean  "global"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registration_periods", force: :cascade do |t|
    t.integer  "conference_id", limit: 4
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "conference_id",       limit: 4
    t.datetime "arrival"
    t.datetime "departure"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "other_special_needs", limit: 65535
    t.boolean  "attended",                          default: false
    t.boolean  "volunteer"
    t.integer  "user_id",             limit: 4
    t.integer  "week",                limit: 4
  end

  create_table "registrations_vchoices", id: false, force: :cascade do |t|
    t.integer "registration_id", limit: 4
    t.integer "vchoice_id",      limit: 4
  end

  create_table "resources", force: :cascade do |t|
    t.string  "name",          limit: 255
    t.text    "description",   limit: 65535
    t.integer "quantity",      limit: 4
    t.integer "used",          limit: 4,     default: 0
    t.integer "conference_id", limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",   limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string  "guid",     limit: 255, null: false
    t.string  "name",     limit: 255, null: false
    t.integer "size",     limit: 4
    t.integer "venue_id", limit: 4,   null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "program_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "schedules", ["program_id"], name: "index_schedules_on_program_id", using: :btree

  create_table "splashpages", force: :cascade do |t|
    t.integer  "conference_id",             limit: 4
    t.boolean  "public"
    t.boolean  "include_tracks"
    t.boolean  "include_program"
    t.boolean  "include_social_media"
    t.boolean  "include_venue"
    t.boolean  "include_tickets"
    t.boolean  "include_registrations"
    t.boolean  "include_sponsors"
    t.boolean  "include_lodgings"
    t.string   "banner_photo_file_name",    limit: 255
    t.string   "banner_photo_content_type", limit: 255
    t.integer  "banner_photo_file_size",    limit: 4
    t.datetime "banner_photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "include_cfp",                           default: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.text     "description",          limit: 65535
    t.string   "website_url",          limit: 255
    t.string   "logo_file_name",       limit: 255
    t.integer  "sponsorship_level_id", limit: 4
    t.integer  "conference_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture",              limit: 255
  end

  create_table "sponsorship_levels", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.integer  "conference_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",      limit: 4
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "conference_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targets", force: :cascade do |t|
    t.integer  "conference_id", limit: 4
    t.integer  "campaign_id",   limit: 4
    t.date     "due_date"
    t.integer  "target_count",  limit: 4
    t.string   "unit",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_purchases", force: :cascade do |t|
    t.integer  "ticket_id",     limit: 4
    t.integer  "conference_id", limit: 4
    t.boolean  "paid",                      default: false
    t.datetime "created_at"
    t.integer  "quantity",      limit: 4,   default: 1
    t.integer  "user_id",       limit: 4
    t.integer  "payment_id",    limit: 4
    t.string   "paymethod",     limit: 255
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "conference_id",  limit: 4
    t.string  "title",          limit: 255,                   null: false
    t.text    "description",    limit: 65535
    t.integer "price_cents",    limit: 4,     default: 0,     null: false
    t.string  "price_currency", limit: 255,   default: "USD", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "guid",        limit: 255,   null: false
    t.string   "name",        limit: 255,   null: false
    t.text     "description", limit: 65535
    t.string   "color",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id",  limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "",    null: false
    t.string   "encrypted_password",     limit: 255,   default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.boolean  "email_public"
    t.text     "biography",              limit: 65535
    t.string   "nickname",               limit: 255
    t.string   "affiliation",            limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "mobile",                 limit: 255
    t.string   "tshirt",                 limit: 255
    t.string   "languages",              limit: 255
    t.text     "volunteer_experience",   limit: 65535
    t.boolean  "is_admin",                             default: false
    t.string   "username",               limit: 255
    t.boolean  "is_disabled",                          default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "users_roles", force: :cascade do |t|
    t.integer "role_id", limit: 4
    t.integer "user_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "vchoices", force: :cascade do |t|
    t.integer "vday_id",      limit: 4
    t.integer "vposition_id", limit: 4
  end

  create_table "vdays", force: :cascade do |t|
    t.integer  "conference_id", limit: 4
    t.date     "day"
    t.text     "description",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "guid",            limit: 255
    t.string   "name",            limit: 255
    t.string   "website",         limit: 255
    t.text     "description",     limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name", limit: 255
    t.string   "street",          limit: 255
    t.string   "postalcode",      limit: 255
    t.string   "city",            limit: 255
    t.string   "country",         limit: 255
    t.string   "latitude",        limit: 255
    t.string   "longitude",       limit: 255
    t.integer  "conference_id",   limit: 4
    t.string   "picture",         limit: 255
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      limit: 255,   null: false
    t.integer  "item_id",        limit: 4,     null: false
    t.string   "event",          limit: 255,   null: false
    t.string   "whodunnit",      limit: 255
    t.text     "object",         limit: 65535
    t.text     "object_changes", limit: 65535
    t.datetime "created_at"
    t.integer  "conference_id",  limit: 4
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "visits", force: :cascade do |t|
    t.uuid     "visitor_id",       limit: 16
    t.string   "ip",               limit: 255
    t.text     "user_agent",       limit: 65535
    t.text     "referrer",         limit: 65535
    t.text     "landing_page",     limit: 65535
    t.integer  "user_id",          limit: 4
    t.string   "referring_domain", limit: 255
    t.string   "search_keyword",   limit: 255
    t.string   "browser",          limit: 255
    t.string   "os",               limit: 255
    t.string   "device_type",      limit: 255
    t.string   "country",          limit: 255
    t.string   "region",           limit: 255
    t.string   "city",             limit: 255
    t.string   "utm_source",       limit: 255
    t.string   "utm_medium",       limit: 255
    t.string   "utm_term",         limit: 255
    t.string   "utm_content",      limit: 255
    t.string   "utm_campaign",     limit: 255
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.integer  "rating",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
  end

  create_table "vpositions", force: :cascade do |t|
    t.integer  "conference_id", limit: 4
    t.string   "title",         limit: 255,   null: false
    t.text     "description",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
