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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

# Could not dump table "ActionLogs" because of following StandardError
#   Unknown type '"enum_ActionLogs_action"' for column 'action'

  create_table "ApiClients", id: :string, limit: 255, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.string "icon", limit: 255
    t.string "redirectUri", limit: 255
    t.string "secret", limit: 255
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "CreatorId"
  end

  create_table "ApplicationDrafts", id: :serial, force: :cascade do |t|
    t.text "note"
    t.jsonb "attachments"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "ApplicantId", null: false
    t.integer "JobId"
  end

# Could not dump table "Applications" because of following StandardError
#   Unknown type '"enum_Applications_status"' for column 'status'

  create_table "Bookmarks", id: :serial, force: :cascade do |t|
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "UserId"
    t.integer "JobId"
    t.integer "CompanyId"
    t.integer "ResourceId"
    t.index ["UserId", "CompanyId"], name: "Bookmarks_UserId_CompanyId_key", unique: true
    t.index ["UserId", "JobId"], name: "Bookmarks_UserId_JobId_key", unique: true
    t.index ["UserId", "ResourceId"], name: "Bookmarks_UserId_ResourceId_key", unique: true
  end

  create_table "Careers", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.string "name", limit: 255
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.text "overview"
    t.string "title", limit: 255
    t.jsonb "interview"
    t.jsonb "secret"
    t.string "bannerPic", limit: 255
  end

  create_table "Cities", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "CountryCode", limit: 255
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
  end

  create_table "Companies", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "logo", limit: 255
    t.string "city", limit: 255
    t.string "tagline", limit: 255
    t.text "description"
    t.string "video", limit: 255
    t.string "website", limit: 255
    t.jsonb "socialMediaSites"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.string "CountryCode", limit: 255
    t.integer "IndustryId"
    t.string "bannerPic", limit: 255
    t.jsonb "descriptionV2"
    t.datetime "planValidUntil"
    t.boolean "isVerified", default: false, null: false
    t.integer "PlanId"
    t.boolean "isHiring", default: false, null: false
    t.boolean "isProvidingResource", default: false, null: false
    t.string "stripeCustomerId", limit: 255
    t.boolean "localOffice", default: true, null: false
    t.jsonb "customAttributes"
    t.jsonb "photos"
    t.jsonb "descriptionRaw"
    t.text "descriptionHTML"
    t.text "descriptionMarkDown"
    t.integer "CityId"
  end

  create_table "CompanyDrafts", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "logo", limit: 255
    t.string "bannerPic", limit: 255
    t.string "city", limit: 255
    t.string "tagline", limit: 255
    t.text "description"
    t.json "descriptionV2"
    t.string "video", limit: 255
    t.string "website", limit: 255
    t.json "socialMediaSites"
    t.boolean "isHiring", default: false, null: false
    t.boolean "isProvidingResource", default: false, null: false
    t.boolean "localOffice", default: true, null: false
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.string "CountryCode", limit: 255
    t.integer "IndustryId"
    t.integer "CreatorId", null: false
    t.integer "PublishId"
  end

  create_table "Countries", primary_key: "code", id: :string, limit: 255, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.string "demonym", limit: 255
    t.jsonb "currency"
    t.jsonb "languages"
  end

  create_table "Degrees", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
  end

  create_table "Entitlements", id: :serial, force: :cascade do |t|
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "ApplicationId"
    t.integer "CompanyId"
    t.integer "JobId"
  end

# Could not dump table "Events" because of following StandardError
#   Unknown type '"enum_Events_currency"' for column 'currency'

# Could not dump table "Experiences" because of following StandardError
#   Unknown type '"enum_Experiences_type"' for column 'type'

  create_table "Follows", id: :serial, force: :cascade do |t|
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "UserId"
    t.integer "CareerId"
    t.integer "ProfessionId"
    t.index ["UserId", "CareerId"], name: "Follows_UserId_CareerId_key", unique: true
    t.index ["UserId", "ProfessionId"], name: "Follows_UserId_ProfessionId_key", unique: true
  end

# Could not dump table "GroupEvents" because of following StandardError
#   Unknown type '"enum_GroupEvents_status"' for column 'status'

# Could not dump table "GroupJobs" because of following StandardError
#   Unknown type '"enum_GroupJobs_status"' for column 'status'

# Could not dump table "GroupMembers" because of following StandardError
#   Unknown type '"enum_GroupMembers_status"' for column 'status'

# Could not dump table "Groups" because of following StandardError
#   Unknown type '"enum_Groups_type"' for column 'type'

# Could not dump table "Identities" because of following StandardError
#   Unknown type '"enum_Identities_type"' for column 'type'

  create_table "Industries", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.string "group", limit: 255
    t.text "overview"
  end

# Could not dump table "Invites" because of following StandardError
#   Unknown type '"enum_Invites_status"' for column 'status'

  create_table "JobCategories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "bannerPic", limit: 255
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.jsonb "customGroupJobCategories", default: {}
  end

  create_table "JobCategorySkills", id: :serial, force: :cascade do |t|
    t.integer "JobCategoryId"
    t.integer "SkillId"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.index ["JobCategoryId", "SkillId"], name: "JobCategorySkills_JobCategoryId_SkillId_key", unique: true
  end

# Could not dump table "JobDrafts" because of following StandardError
#   Unknown type '"enum_JobDrafts_status"' for column 'status'

  create_table "JobJobTitleDrafts", id: :serial, force: :cascade do |t|
    t.integer "JobDraftId"
    t.integer "JobTitleId"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.index ["JobDraftId", "JobTitleId"], name: "JobJobTitleDrafts_JobDraftId_JobTitleId_key", unique: true
  end

  create_table "JobJobTitles", id: :serial, force: :cascade do |t|
    t.integer "JobId"
    t.integer "JobTitleId"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.index ["JobId", "JobTitleId"], name: "JobJobTitles_JobId_JobTitleId_key", unique: true
  end

  create_table "JobLocationPreferences", id: :serial, force: :cascade do |t|
    t.boolean "needsVisa"
    t.string "CountryCode", limit: 255
    t.integer "UserId"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.index ["UserId", "CountryCode"], name: "JobLocationPreferences_UserId_CountryCode_key", unique: true
  end

  create_table "JobRolePreferences", id: :serial, force: :cascade do |t|
    t.integer "experience"
    t.integer "JobCategoryId"
    t.integer "JobTitleId"
    t.integer "UserId"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.index ["UserId", "JobCategoryId"], name: "JobRolePreferences_UserId_JobCategoryId_key", unique: true
    t.index ["UserId", "JobTitleId"], name: "JobRolePreferences_UserId_JobTitleId_key", unique: true
  end

# Could not dump table "JobSalaries" because of following StandardError
#   Unknown type '"enum_JobSalaries_salaryType"' for column 'salaryType'

# Could not dump table "JobSalaryDrafts" because of following StandardError
#   Unknown type '"enum_JobSalaryDrafts_salaryType"' for column 'salaryType'

  create_table "JobSkillDrafts", id: :serial, force: :cascade do |t|
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "JobDraftId"
    t.integer "SkillId"
    t.index ["JobDraftId", "SkillId"], name: "JobSkillDrafts_JobDraftId_SkillId_key", unique: true
  end

  create_table "JobSkills", id: :serial, force: :cascade do |t|
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "JobId"
    t.integer "SkillId"
    t.index ["JobId", "SkillId"], name: "JobSkills_JobId_SkillId_key", unique: true
  end

  create_table "JobTags", id: :serial, force: :cascade do |t|
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "JobId"
    t.string "TagId", limit: 255
    t.index ["JobId", "TagId"], name: "JobTags_JobId_TagId_key", unique: true
  end

  create_table "JobTitleSkills", id: :serial, force: :cascade do |t|
    t.integer "JobTitleId"
    t.integer "SkillId"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.index ["JobTitleId", "SkillId"], name: "JobTitleSkills_JobTitleId_SkillId_key", unique: true
  end

  create_table "JobTitles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "bannerPic", limit: 255
    t.integer "JobCategoryId"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
  end

# Could not dump table "Jobs" because of following StandardError
#   Unknown type '"enum_Jobs_status"' for column 'status'

# Could not dump table "PendingSkills" because of following StandardError
#   Unknown type '"enum_PendingSkills_status"' for column 'status'

# Could not dump table "PerkClaims" because of following StandardError
#   Unknown type '"enum_PerkClaims_status"' for column 'status'

# Could not dump table "Perks" because of following StandardError
#   Unknown type '"enum_Perks_voucherType"' for column 'voucherType'

# Could not dump table "Plans" because of following StandardError
#   Unknown type '"enum_Plans_interval"' for column 'interval'

# Could not dump table "Points" because of following StandardError
#   Unknown type '"enum_Points_type"' for column 'type'

# Could not dump table "Preferences" because of following StandardError
#   Unknown type '"enum_Preferences_currency"' for column 'currency'

  create_table "ProfessionSkills", id: :serial, force: :cascade do |t|
    t.integer "weightage", default: 1, null: false
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "ProfessionId"
    t.integer "SkillId"
    t.index ["ProfessionId", "SkillId"], name: "ProfessionSkills_ProfessionId_SkillId_key", unique: true
  end

  create_table "Professions", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.jsonb "aDayInLife"
    t.text "overview"
    t.string "bannerPic", limit: 255
    t.integer "juniorAvgSalary"
    t.integer "juniorMinSalary"
    t.integer "juniorMaxSalary"
    t.integer "midAvgSalary"
    t.integer "midMinSalary"
    t.integer "midMaxSalary"
    t.integer "seniorAvgSalary"
    t.integer "seniorMinSalary"
    t.integer "seniorMaxSalary"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "CareerId"
  end

  create_table "ProfileExperiences", id: :serial, force: :cascade do |t|
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "ProfileId"
    t.integer "ExperienceId"
    t.index ["ProfileId", "ExperienceId"], name: "ProfileExperiences_ProfileId_ExperienceId_key", unique: true
  end

  create_table "ProfileSkills", id: :serial, force: :cascade do |t|
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "ProfileId"
    t.integer "UserSkillId"
    t.index ["ProfileId", "UserSkillId"], name: "ProfileSkills_ProfileId_UserSkillId_key", unique: true
  end

  create_table "Profiles", id: :serial, force: :cascade do |t|
    t.string "label", limit: 255
    t.text "intro"
    t.string "profilePic", limit: 255
    t.string "resume", limit: 255
    t.string "portfolio", limit: 255
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "UserId"
  end

  create_table "ResourceSkills", id: :serial, force: :cascade do |t|
    t.integer "weightage", default: 1, null: false
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "ResourceId"
    t.integer "SkillId"
    t.index ["ResourceId", "SkillId"], name: "ResourceSkills_ResourceId_SkillId_key", unique: true
  end

# Could not dump table "Resources" because of following StandardError
#   Unknown type '"enum_Resources_type"' for column 'type'

  create_table "SchoolCourses", id: :serial, force: :cascade do |t|
    t.integer "SchoolId", null: false
    t.integer "DegreeId", null: false
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
  end

  create_table "Schools", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "domain", limit: 255
    t.string "website", limit: 255
    t.string "state", limit: 255
    t.string "CountryCode", limit: 255
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
  end

  create_table "Scores", id: :serial, force: :cascade do |t|
    t.integer "userScore"
    t.integer "companyScore"
    t.integer "UserId"
    t.integer "CompanyId"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
  end

  create_table "Skills", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
  end

  create_table "Studies", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
  end

  create_table "Tags", id: :string, limit: 255, force: :cascade do |t|
    t.jsonb "features"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
  end

# Could not dump table "UserCompanies" because of following StandardError
#   Unknown type '"enum_UserCompanies_role"' for column 'role'

  create_table "UserSkills", id: :serial, force: :cascade do |t|
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "UserId"
    t.integer "SkillId"
    t.integer "level", default: 2, null: false
    t.index ["UserId", "SkillId"], name: "UserSkills_UserId_SkillId_key", unique: true
  end

# Could not dump table "Users" because of following StandardError
#   Unknown type '"enum_Users_role"' for column 'role'

  add_foreign_key "ApiClients", "\"Users\"", column: "CreatorId", name: "ApiClients_CreatorId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ApplicationDrafts", "\"Jobs\"", column: "JobId", name: "ApplicationDrafts_JobId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ApplicationDrafts", "\"Users\"", column: "ApplicantId", name: "ApplicationDrafts_ApplicantId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Applications", "\"Jobs\"", column: "JobId", name: "Applications_JobId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Applications", "\"Users\"", column: "ApplicantId", name: "Applications_ApplicantId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Bookmarks", "\"Companies\"", column: "CompanyId", name: "Bookmarks_CompanyId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Bookmarks", "\"Jobs\"", column: "JobId", name: "Bookmarks_JobId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Bookmarks", "\"Resources\"", column: "ResourceId", name: "Bookmarks_ResourceId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Bookmarks", "\"Users\"", column: "UserId", name: "Bookmarks_UserId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Cities", "\"Countries\"", column: "CountryCode", primary_key: "code", name: "Cities_CountryCode_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Companies", "\"Cities\"", column: "CityId", name: "Companies_CityId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Companies", "\"Countries\"", column: "CountryCode", primary_key: "code", name: "Companies_CountryCode_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Companies", "\"Industries\"", column: "IndustryId", name: "Companies_IndustryId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Companies", "\"Plans\"", column: "PlanId", name: "Companies_PlanId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "CompanyDrafts", "\"Companies\"", column: "PublishId", name: "CompanyDrafts_PublishId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "CompanyDrafts", "\"Countries\"", column: "CountryCode", primary_key: "code", name: "CompanyDrafts_CountryCode_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "CompanyDrafts", "\"Industries\"", column: "IndustryId", name: "CompanyDrafts_IndustryId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "CompanyDrafts", "\"Users\"", column: "CreatorId", name: "CompanyDrafts_CreatorId_fkey", on_update: :cascade
  add_foreign_key "Entitlements", "\"Applications\"", column: "ApplicationId", name: "Entitlements_ApplicationId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Entitlements", "\"Companies\"", column: "CompanyId", name: "Entitlements_CompanyId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Entitlements", "\"Jobs\"", column: "JobId", name: "Entitlements_JobId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Events", "\"Companies\"", column: "CompanyId", name: "Events_CompanyId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Experiences", "\"Degrees\"", column: "DegreeId", name: "Experiences_DegreeId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Experiences", "\"Schools\"", column: "SchoolId", name: "Experiences_SchoolId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Experiences", "\"Studies\"", column: "StudyId", name: "Experiences_StudyId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Experiences", "\"Users\"", column: "UserId", name: "Experiences_UserId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Follows", "\"Careers\"", column: "CareerId", name: "Follows_CareerId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Follows", "\"Professions\"", column: "ProfessionId", name: "Follows_ProfessionId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Follows", "\"Users\"", column: "UserId", name: "Follows_UserId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "GroupEvents", "\"Events\"", column: "EventId", name: "GroupEvents_EventId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "GroupEvents", "\"Groups\"", column: "GroupId", name: "GroupEvents_GroupId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "GroupJobs", "\"Groups\"", column: "GroupId", name: "GroupJobs_GroupId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "GroupJobs", "\"Jobs\"", column: "JobId", name: "GroupJobs_JobId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "GroupMembers", "\"Companies\"", column: "CompanyId", name: "GroupMembers_CompanyId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "GroupMembers", "\"Groups\"", column: "GroupId", name: "GroupMembers_GroupId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "GroupMembers", "\"Users\"", column: "AdminId", name: "GroupMembers_AdminId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "GroupMembers", "\"Users\"", column: "CandidateId", name: "GroupMembers_CandidateId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Identities", "\"Users\"", column: "UserId", name: "Identities_UserId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Invites", "\"Jobs\"", column: "JobId", name: "Invites_JobId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Invites", "\"Users\"", column: "CandidateId", name: "Invites_CandidateId_fkey", on_update: :cascade
  add_foreign_key "Invites", "\"Users\"", column: "SenderId", name: "Invites_UserId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "JobCategorySkills", "\"JobCategories\"", column: "JobCategoryId", name: "JobCategorySkills_JobCategoryId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobDrafts", "\"Careers\"", column: "CareerId", name: "JobDrafts_CareerId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "JobDrafts", "\"Cities\"", column: "CityId", name: "JobDrafts_CityId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "JobDrafts", "\"Companies\"", column: "CompanyId", name: "JobDrafts_CompanyId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "JobDrafts", "\"Countries\"", column: "CountryCode", primary_key: "code", name: "JobDrafts_CountryCode_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "JobDrafts", "\"JobCategories\"", column: "JobCategoryId", name: "JobDrafts_JobCategoryId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "JobDrafts", "\"Jobs\"", column: "PublishId", name: "JobDrafts_PublishId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobDrafts", "\"Professions\"", column: "ProfessionId", name: "JobDrafts_ProfessionId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "JobDrafts", "\"Users\"", column: "CreatorId", name: "JobDrafts_CreatorId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "JobJobTitleDrafts", "\"JobDrafts\"", column: "JobDraftId", name: "JobJobTitleDrafts_JobDraftId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobJobTitleDrafts", "\"JobTitles\"", column: "JobTitleId", name: "JobJobTitleDrafts_JobTitleId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobJobTitles", "\"JobTitles\"", column: "JobTitleId", name: "JobJobTitles_JobTitleId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobJobTitles", "\"Jobs\"", column: "JobId", name: "JobJobTitles_JobId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobLocationPreferences", "\"Countries\"", column: "CountryCode", primary_key: "code", name: "JobLocationPreferences_CountryCode_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobLocationPreferences", "\"Users\"", column: "UserId", name: "JobLocationPreferences_UserId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobRolePreferences", "\"JobCategories\"", column: "JobCategoryId", name: "JobRolePreferences_JobCategoryId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobRolePreferences", "\"JobTitles\"", column: "JobTitleId", name: "JobRolePreferences_JobTitleId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobRolePreferences", "\"Users\"", column: "UserId", name: "JobRolePreferences_UserId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobSalaries", "\"Jobs\"", column: "JobId", name: "JobSalaries_JobId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobSalaryDrafts", "\"JobDrafts\"", column: "JobDraftId", name: "JobSalaryDrafts_JobDraftId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobSkillDrafts", "\"JobDrafts\"", column: "JobDraftId", name: "JobSkillDrafts_JobDraftId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobSkills", "\"Jobs\"", column: "JobId", name: "JobSkills_JobId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobTags", "\"Jobs\"", column: "JobId", name: "JobTags_JobId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobTags", "\"Tags\"", column: "TagId", name: "JobTags_TagId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobTitleSkills", "\"JobTitles\"", column: "JobTitleId", name: "JobTitleSkills_JobTitleId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "JobTitles", "\"JobCategories\"", column: "JobCategoryId", name: "JobTitles_JobCategoryId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Jobs", "\"Careers\"", column: "CareerId", name: "Jobs_CareerId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Jobs", "\"Cities\"", column: "CityId", name: "Jobs_CityId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Jobs", "\"Companies\"", column: "CompanyId", name: "Jobs_CompanyId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Jobs", "\"Countries\"", column: "CountryCode", primary_key: "code", name: "Jobs_CountryCode_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Jobs", "\"JobCategories\"", column: "JobCategoryId", name: "Jobs_JobCategoryId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Jobs", "\"Professions\"", column: "ProfessionId", name: "Jobs_ProfessionId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Jobs", "\"Users\"", column: "CreatorId", name: "Jobs_CreatorId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Jobs", "\"Users\"", column: "ReviewerId", name: "Jobs_ReviewerId_fkey"
  add_foreign_key "PendingSkills", "\"Users\"", column: "EvaluatorId", name: "PendingSkills_EvaluatorId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "PendingSkills", "\"Users\"", column: "SuggesterId", name: "PendingSkills_SuggesterId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "PerkClaims", "\"Perks\"", column: "PerkId", name: "PerkClaims_PerkId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "PerkClaims", "\"Users\"", column: "UserId", name: "PerkClaims_UserId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Perks", "\"Companies\"", column: "CompanyId", name: "Perks_CompanyId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Preferences", "\"Users\"", column: "UserId", name: "Preferences_UserId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ProfessionSkills", "\"Professions\"", column: "ProfessionId", name: "ProfessionSkills_ProfessionId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Professions", "\"Careers\"", column: "CareerId", name: "Professions_CareerId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ProfileExperiences", "\"Experiences\"", column: "ExperienceId", name: "ProfileExperiences_ExperienceId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ProfileExperiences", "\"Profiles\"", column: "ProfileId", name: "ProfileExperiences_ProfileId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ProfileSkills", "\"Profiles\"", column: "ProfileId", name: "ProfileSkills_ProfileId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ProfileSkills", "\"UserSkills\"", column: "UserSkillId", name: "ProfileSkills_UserSkillId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Profiles", "\"Users\"", column: "UserId", name: "Profiles_UserId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ResourceSkills", "\"Resources\"", column: "ResourceId", name: "ResourceSkills_ResourceId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Resources", "\"Careers\"", column: "CareerId", name: "Resources_CareerId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Resources", "\"Countries\"", column: "Currency", primary_key: "code", name: "Resources_Currency_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Resources", "\"Users\"", column: "CreatorId", name: "Resources_CreatorId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "SchoolCourses", "\"Degrees\"", column: "DegreeId", name: "SchoolCourses_DegreeId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "SchoolCourses", "\"Schools\"", column: "SchoolId", name: "SchoolCourses_SchoolId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Schools", "\"Countries\"", column: "CountryCode", primary_key: "code", name: "Schools_CountryCode_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Scores", "\"Companies\"", column: "CompanyId", name: "Scores_CompanyId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Scores", "\"Users\"", column: "UserId", name: "Scores_UserId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "UserCompanies", "\"Companies\"", column: "CompanyId", name: "UserCompanies_CompanyId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "UserCompanies", "\"Users\"", column: "UserId", name: "UserCompanies_UserId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "UserSkills", "\"Users\"", column: "UserId", name: "UserSkills_UserId_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Users", "\"Cities\"", column: "CityId", name: "Users_CityId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Users", "\"Countries\"", column: "CountryCode", primary_key: "code", name: "Users_CountryCode_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Users", "\"Countries\"", column: "Nationality", primary_key: "code", name: "Users_Nationality_fkey"
end
