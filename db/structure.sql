CREATE TABLE "assignments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" text, "due_date" datetime, "instructor_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "title" varchar(255));
CREATE TABLE "assignments_groups" ("assignment_id" integer, "group_id" integer);
CREATE TABLE "courses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "courses_users" ("course_id" integer, "user_id" integer);
CREATE TABLE "groups" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "group_name" varchar(255), "instructor_id" integer, "section_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "date" datetime, "content" text, "user_id" integer, "group_id" integer, "assignment_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "scores" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "score" decimal, "max_score" decimal, "group_id" integer, "assignment_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "sections" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "number" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "skills" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "submissions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "label" varchar(255), "content" text, "submitted_date" datetime, "group_id" integer, "assignment_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "about" text, "section_id" integer, "interest" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "cid" integer, "type" varchar(255), "group_id" integer, "email" varchar(255));
CREATE INDEX "index_assignments_groups_on_assignment_id_and_group_id" ON "assignments_groups" ("assignment_id", "group_id");
CREATE INDEX "index_assignments_groups_on_group_id" ON "assignments_groups" ("group_id");
CREATE INDEX "index_assignments_on_instructor_id" ON "assignments" ("instructor_id");
CREATE UNIQUE INDEX "index_courses_on_name" ON "courses" ("name");
CREATE UNIQUE INDEX "index_courses_users_on_course_id_and_user_id" ON "courses_users" ("course_id", "user_id");
CREATE INDEX "index_groups_on_instructor_id" ON "groups" ("instructor_id");
CREATE INDEX "index_groups_on_section_id" ON "groups" ("section_id");
CREATE INDEX "index_posts_on_assignment_id" ON "posts" ("assignment_id");
CREATE INDEX "index_posts_on_group_id" ON "posts" ("group_id");
CREATE INDEX "index_posts_on_user_id" ON "posts" ("user_id");
CREATE INDEX "index_scores_on_assignment_id" ON "scores" ("assignment_id");
CREATE INDEX "index_scores_on_group_id" ON "scores" ("group_id");
CREATE UNIQUE INDEX "index_sections_on_number" ON "sections" ("number");
CREATE INDEX "index_submissions_on_assignment_id" ON "submissions" ("assignment_id");
CREATE INDEX "index_submissions_on_group_id" ON "submissions" ("group_id");
CREATE INDEX "index_users_on_group_id" ON "users" ("group_id");
CREATE INDEX "index_users_on_section_id" ON "users" ("section_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20131027214140');

INSERT INTO schema_migrations (version) VALUES ('20131027214254');

INSERT INTO schema_migrations (version) VALUES ('20131027214313');

INSERT INTO schema_migrations (version) VALUES ('20131027214533');

INSERT INTO schema_migrations (version) VALUES ('20131027215106');

INSERT INTO schema_migrations (version) VALUES ('20131101095422');

INSERT INTO schema_migrations (version) VALUES ('20131105232823');

INSERT INTO schema_migrations (version) VALUES ('20131105233241');

INSERT INTO schema_migrations (version) VALUES ('20131105233346');

INSERT INTO schema_migrations (version) VALUES ('20131105233523');

INSERT INTO schema_migrations (version) VALUES ('20131105234958');

INSERT INTO schema_migrations (version) VALUES ('20131106001513');

INSERT INTO schema_migrations (version) VALUES ('20131110041549');

INSERT INTO schema_migrations (version) VALUES ('20131110180333');

INSERT INTO schema_migrations (version) VALUES ('20131110184834');

INSERT INTO schema_migrations (version) VALUES ('20131115092005');