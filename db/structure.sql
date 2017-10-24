SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: analytics; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA analytics;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = analytics, pg_catalog;

--
-- Name: enum_ActionLogSummary_action; Type: TYPE; Schema: analytics; Owner: -
--

CREATE TYPE "enum_ActionLogSummary_action" AS ENUM (
    'CREATE',
    'UPDATE',
    'READ',
    'DELETE'
);


SET search_path = public, pg_catalog;

--
-- Name: enum_ActionLogs_action; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_ActionLogs_action" AS ENUM (
    'CREATE',
    'UPDATE',
    'READ',
    'DELETE'
);


--
-- Name: enum_Applications_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Applications_status" AS ENUM (
    'NEW',
    'IN_REVIEW',
    'INTERVIEWING',
    'OFFERED',
    'HIRED',
    'REJECTED'
);


--
-- Name: enum_Events_currency; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Events_currency" AS ENUM (
    'SGD',
    'USD',
    'EUR',
    'GBP',
    'MYR',
    'IDR',
    'INR'
);


--
-- Name: enum_Experiences_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Experiences_type" AS ENUM (
    'WORK',
    'EDUCATION',
    'CCA',
    'AWARD'
);


--
-- Name: enum_GroupEvents_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_GroupEvents_status" AS ENUM (
    'APPROVED',
    'PENDING',
    'REJECTED'
);


--
-- Name: enum_GroupJobs_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_GroupJobs_status" AS ENUM (
    'APPROVED',
    'PENDING',
    'REJECTED'
);


--
-- Name: enum_GroupMembers_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_GroupMembers_status" AS ENUM (
    'APPROVED',
    'PENDING',
    'IN_REVIEW'
);


--
-- Name: enum_Groups_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Groups_type" AS ENUM (
    'CANDIDATE',
    'COMPANY'
);


--
-- Name: enum_Identities_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Identities_type" AS ENUM (
    'FACEBOOK',
    'LINKEDIN',
    'NGEEANN',
    'NPSTAFF',
    'SP',
    'TP',
    'SIA'
);


--
-- Name: enum_Invites_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Invites_status" AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED'
);


--
-- Name: enum_JobDrafts_paymentChoice; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_JobDrafts_paymentChoice" AS ENUM (
    'LATER',
    'PENDING',
    'NOW'
);


--
-- Name: enum_JobDrafts_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_JobDrafts_status" AS ENUM (
    'OPEN',
    'CLOSED'
);


--
-- Name: enum_JobDrafts_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_JobDrafts_type" AS ENUM (
    'INTERNSHIP',
    'FULL_TIME',
    'PROJECT_BASED',
    'PART_TIME',
    'EXTERNSHIP',
    'GLOBAL',
    'STRUCTURED'
);


--
-- Name: enum_JobSalaries_currency; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_JobSalaries_currency" AS ENUM (
    'SGD',
    'USD',
    'EUR',
    'GBP',
    'MYR',
    'IDR',
    'INR'
);


--
-- Name: enum_JobSalaries_salaryMode; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_JobSalaries_salaryMode" AS ENUM (
    'MONTH',
    'YEAR',
    'PROJECT'
);


--
-- Name: enum_JobSalaries_salaryType; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_JobSalaries_salaryType" AS ENUM (
    'BASIC',
    'BONUS'
);


--
-- Name: enum_JobSalaryDrafts_currency; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_JobSalaryDrafts_currency" AS ENUM (
    'SGD',
    'USD',
    'EUR',
    'GBP',
    'MYR',
    'IDR',
    'INR'
);


--
-- Name: enum_JobSalaryDrafts_salaryMode; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_JobSalaryDrafts_salaryMode" AS ENUM (
    'MONTH',
    'YEAR',
    'PROJECT'
);


--
-- Name: enum_JobSalaryDrafts_salaryType; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_JobSalaryDrafts_salaryType" AS ENUM (
    'BASIC',
    'BONUS'
);


--
-- Name: enum_Jobs_paymentChoice; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Jobs_paymentChoice" AS ENUM (
    'LATER',
    'PENDING',
    'NOW'
);


--
-- Name: enum_Jobs_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Jobs_status" AS ENUM (
    'OPEN',
    'CLOSED'
);


--
-- Name: enum_Jobs_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Jobs_type" AS ENUM (
    'INTERNSHIP',
    'FULL_TIME',
    'PROJECT_BASED',
    'PART_TIME',
    'EXTERNSHIP',
    'GLOBAL',
    'STRUCTURED'
);


--
-- Name: enum_PendingSkills_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_PendingSkills_status" AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED'
);


--
-- Name: enum_PerkClaims_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_PerkClaims_status" AS ENUM (
    'AVAILABLE',
    'CLAIMED',
    'EXPIRED',
    'COMMON'
);


--
-- Name: enum_Perks_voucherType; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Perks_voucherType" AS ENUM (
    'COMMON',
    'UNIQUE'
);


--
-- Name: enum_Plans_interval; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Plans_interval" AS ENUM (
    'day',
    'week',
    'month',
    'year'
);


--
-- Name: enum_Points_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Points_type" AS ENUM (
    'PROFILE',
    'ACCOUNT',
    'COMPANY',
    'REDEEM',
    'OTHERS'
);


--
-- Name: enum_Preferences_currency; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Preferences_currency" AS ENUM (
    'SGD',
    'USD',
    'EUR',
    'GBP',
    'MYR',
    'IDR',
    'INR'
);


--
-- Name: enum_Resources_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Resources_type" AS ENUM (
    'ARTICLE',
    'TUTORIAL',
    'VIDEO',
    'BOOK',
    'COURSE'
);


--
-- Name: enum_UserCompanies_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_UserCompanies_role" AS ENUM (
    'ADMIN',
    'RECRUITER'
);


--
-- Name: enum_Users_educationLevel; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Users_educationLevel" AS ENUM (
    'PHD',
    'MASTER',
    'POSTGRAD',
    'DEGREE',
    'ADV_DIPLOMA',
    'DIPLOMA',
    'A-LEVEL',
    'NITEC',
    'PRO_CERT'
);


--
-- Name: enum_Users_gender; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Users_gender" AS ENUM (
    'FEMALE',
    'MALE'
);


--
-- Name: enum_Users_race; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Users_race" AS ENUM (
    'MALAY',
    'INDIAN',
    'CHINESE',
    'OTHERS'
);


--
-- Name: enum_Users_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Users_role" AS ENUM (
    'SUPER_ADMIN',
    'REVIEWER',
    'CANDIDATE',
    'COMPANY',
    'GROUP_ADMIN',
    'RECOMMEND_ONLY'
);


SET search_path = analytics, pg_catalog;

--
-- Name: recount_action_logs_summary(); Type: FUNCTION; Schema: analytics; Owner: -
--

CREATE FUNCTION recount_action_logs_summary() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (NEW.flag_recount = TRUE) THEN
    UPDATE analytics."ActionLogSummary"
    SET (flag_recount, count) =
    (
      FALSE,
      (
        SELECT count(*)
        FROM public."ActionLogs"
        WHERE object = OLD.object
              AND action = OLD.action
              AND collection = OLD.collection
      )
    )
    WHERE object = OLD.object
          AND action = OLD.action
          AND collection = OLD.collection;
  END IF;

  RETURN NULL;
END
$$;


--
-- Name: recount_application_view_summary(); Type: FUNCTION; Schema: analytics; Owner: -
--

CREATE FUNCTION recount_application_view_summary() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (NEW.flag_recount = TRUE) THEN
    UPDATE analytics."ApplicationViewSummary"
    SET (flag_recount, count) =
    (
      FALSE,
      (
        SELECT count(*)
        FROM public."ActionLogs"
        WHERE object = OLD.object
              AND action = 'READ'
              AND collection = 'applications'
              AND "userId" != (SELECT "ApplicantId" FROM public."Applications" WHERE id = OLD.object::INTEGER)
      )
    )
    WHERE object = OLD.object;
  END IF;

  RETURN NULL;
END
$$;


--
-- Name: update_action_logs_summary(); Type: FUNCTION; Schema: analytics; Owner: -
--

CREATE FUNCTION update_action_logs_summary() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  row_count integer;

BEGIN
  row_count := (
    SELECT count(*)
    FROM analytics."ActionLogSummary"
    WHERE object = NEW.object
          AND action = NEW.action
          AND collection = NEW.collection
  );

  IF (row_count > 0) THEN
    UPDATE analytics."ActionLogSummary" SET (count) = (analytics."ActionLogSummary".count + 1)
    WHERE object = NEW.object
          AND action = NEW.action
          AND collection = NEW.collection;
  ELSE
    INSERT INTO analytics."ActionLogSummary"(
      object,
      action,
      collection,
      count
    )
    VALUES (
      NEW.object,
      NEW.action,
      NEW.collection,
      (
        SELECT count(*)
        FROM public."ActionLogs"
        WHERE object = NEW.object
              AND action = NEW.action
              AND collection = NEW.collection
      )
    );
  END IF;

  RETURN NULL;
END
$$;


--
-- Name: update_active_user_summary(); Type: FUNCTION; Schema: analytics; Owner: -
--

CREATE FUNCTION update_active_user_summary() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  row_count integer;

BEGIN
  row_count := (
    SELECT count(*)
    FROM analytics."ActiveUserSummary"
    WHERE "userId" = NEW."userId"
    AND day = date_trunc('day', NEW."createdAt")
  );

  IF (row_count = 0) THEN
    INSERT INTO analytics."ActiveUserSummary"(
      "userId",
      day
    )
    VALUES (
      NEW."userId",
      date_trunc('day', NEW."createdAt")
    );
  END IF;

  RETURN NULL;
END
$$;


--
-- Name: update_application_view_summary(); Type: FUNCTION; Schema: analytics; Owner: -
--

CREATE FUNCTION update_application_view_summary() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  row_count integer;

BEGIN
  row_count := (
    SELECT count(*)
    FROM analytics."ApplicationViewSummary"
    WHERE object = NEW.object
  );

  IF (row_count > 0) THEN
    IF (NEW."userId" != (SELECT "ApplicantId" FROM public."Applications" WHERE id = NEW.object::INTEGER)) THEN
      UPDATE analytics."ApplicationViewSummary" SET (count) = ("ApplicationViewSummary".count + 1)
      WHERE object = NEW.object;
      END IF;
  ELSE
    INSERT INTO analytics."ApplicationViewSummary"(
      object,
      count
    )
    VALUES (
      NEW.object,
      (
        SELECT count(*)
        FROM public."ActionLogs"
        WHERE object = NEW.object
              AND action = 'READ'
              AND collection = 'applications'
              AND "userId" != (SELECT "ApplicantId" FROM public."Applications" WHERE id = NEW.object::INTEGER)
      )
    );
  END IF;

  RETURN NULL;
END
$$;


SET search_path = public, pg_catalog;

--
-- Name: activeusers(date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION activeusers(date, date) RETURNS bigint
    LANGUAGE sql
    AS $_$
  SELECT COUNT(*) FROM (SELECT COUNT("userId") FROM "ActionLogs" WHERE "createdAt" >= $1 AND "createdAt" < $2 GROUP BY "userId") AS "UNIQUE";
$_$;


--
-- Name: givedays(integer, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION givedays(integer, date) RETURNS numeric
    LANGUAGE sql
    AS $_$
  SELECT AVG("x-day") FROM (SELECT COUNT(*) as "x-day" FROM "Applications" AS A FULL OUTER JOIN "Jobs" AS J ON A."JobId" = J.id WHERE A."createdAt" <= J."createdAt" + $1 * interval '1 day' AND J."createdAt" <= now() - $1 * interval '1 day' and J."createdAt" >= $2 - $1 * 4 * interval '1 day' and J."createdAt" <= $2 GROUP BY J.id) AS "Total Number of Jobs";
$_$;


--
-- Name: keystats(date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION keystats(date, date) RETURNS TABLE(applications bigint, jobs bigint, candidates bigint, companyowners bigint, companies bigint, active bigint)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY
    SELECT (
        SELECT count(*)
        FROM "Applications" WHERE  "createdAt" >= $1 AND "createdAt" <= $2
        ),
        (
        SELECT count(*)
            FROM "Jobs" WHERE  "createdAt" >= $1 AND "createdAt" <= $2
        ),
        (
        SELECT count(*)
            FROM "Users" WHERE "preferences" ->> 'profileMode' = 'candidate'
                           AND "createdAt" >= $1 AND "createdAt" <= $2
        ),
        (
        SELECT count(*)
            FROM "Users" WHERE "preferences" ->> 'profileMode' = 'company'
                           AND "createdAt" >= $1 AND "createdAt" <= $2
        ),
        (
        SELECT count(*)
            FROM "Companies" WHERE "createdAt" >= $1 AND "createdAt" <= $2
        ),
        (
        SELECT activeusers($1, $2)
        );
END
$_$;


--
-- Name: weekly(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION weekly() RETURNS TABLE(application_count bigint, job_count bigint, user_count bigint, company_count bigint, candidate_count bigint, active_users bigint, monday timestamp with time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY
  WITH application_count AS
  (SELECT COUNT(*) as "Application Count",
          date_trunc('week', "createdAt") as week
   FROM "Applications"
   GROUP BY week
   ORDER BY week),
      job_count AS
    (SELECT COUNT(*) as "Job Count",
            date_trunc('week', "createdAt") as week
     FROM "Jobs"
     GROUP BY week
     ORDER BY week),
      user_count AS
    (SELECT COUNT(*) as "User Count",
            date_trunc('week', "createdAt") as week
     FROM "Users"
     GROUP BY week
     ORDER BY week),
      company_count AS
    (SELECT COUNT(*) as "Company Count",
            date_trunc('week', "createdAt") as week
     FROM "Users"
     WHERE preferences ->> 'profileMode' = 'company'
     GROUP BY week
     ORDER BY week),
      candidate_count AS
    (SELECT COUNT(*) as "Candidate Count",
            date_trunc('week', "createdAt") as week
     FROM "Users"
     WHERE preferences ->> 'profileMode' = 'candidate'
     GROUP BY week
     ORDER BY week),
      active_users AS
    (SELECT count(*) as "Active User Count",
       week
     FROM (SELECT "userId", date_trunc('week', "createdAt") as week
           FROM "ActionLogs"
           GROUP BY "userId", week
           ORDER BY week)
       AS "UNIQUE"
     GROUP BY week)
  SELECT "Application Count", "Job Count", "User Count", "Company Count", "Candidate Count", "Active User Count", company_count.week as "Monday of Week"
  FROM application_count, job_count, user_count, company_count, candidate_count, active_users
  WHERE application_count.week = user_count.week
        AND user_count.week = company_count.week
        AND company_count.week = candidate_count.week
        AND candidate_count.week = job_count.week
        AND job_count.week = active_users.week;
END
$$;


SET search_path = analytics, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ActionLogSummary; Type: TABLE; Schema: analytics; Owner: -
--

CREATE TABLE "ActionLogSummary" (
    id integer NOT NULL,
    object character varying(255) NOT NULL,
    action public."enum_ActionLogs_action" NOT NULL,
    collection character varying(255) NOT NULL,
    count bigint DEFAULT 0 NOT NULL,
    flag_recount boolean DEFAULT false NOT NULL
);


--
-- Name: ActiveUserSummary; Type: TABLE; Schema: analytics; Owner: -
--

CREATE TABLE "ActiveUserSummary" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    day date NOT NULL
);


--
-- Name: ActiveUserSummary_id_seq; Type: SEQUENCE; Schema: analytics; Owner: -
--

CREATE SEQUENCE "ActiveUserSummary_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ActiveUserSummary_id_seq; Type: SEQUENCE OWNED BY; Schema: analytics; Owner: -
--

ALTER SEQUENCE "ActiveUserSummary_id_seq" OWNED BY "ActiveUserSummary".id;


--
-- Name: ApplicationViewSummary; Type: TABLE; Schema: analytics; Owner: -
--

CREATE TABLE "ApplicationViewSummary" (
    id integer NOT NULL,
    object character varying(255) NOT NULL,
    count bigint DEFAULT 0 NOT NULL,
    flag_recount boolean DEFAULT false NOT NULL
);


--
-- Name: ApplicationViewSummary_id_seq; Type: SEQUENCE; Schema: analytics; Owner: -
--

CREATE SEQUENCE "ApplicationViewSummary_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ApplicationViewSummary_id_seq; Type: SEQUENCE OWNED BY; Schema: analytics; Owner: -
--

ALTER SEQUENCE "ApplicationViewSummary_id_seq" OWNED BY "ApplicationViewSummary".id;


--
-- Name: action_logs_summary_id_seq; Type: SEQUENCE; Schema: analytics; Owner: -
--

CREATE SEQUENCE action_logs_summary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_logs_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: analytics; Owner: -
--

ALTER SEQUENCE action_logs_summary_id_seq OWNED BY "ActionLogSummary".id;


SET search_path = public, pg_catalog;

--
-- Name: ActionLogs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ActionLogs" (
    id integer NOT NULL,
    object character varying(255),
    action "enum_ActionLogs_action" NOT NULL,
    "additionalInfo" jsonb,
    "ipAddress" inet,
    "userId" integer,
    "apiClientId" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    collection character varying(255)
);


--
-- Name: ActionLogs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ActionLogs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ActionLogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ActionLogs_id_seq" OWNED BY "ActionLogs".id;


--
-- Name: ApiClients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ApiClients" (
    id character varying(255) NOT NULL,
    name character varying(255),
    description text,
    icon character varying(255),
    "redirectUri" character varying(255),
    secret character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CreatorId" integer
);


--
-- Name: ApplicationDrafts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ApplicationDrafts" (
    id integer NOT NULL,
    note text,
    attachments jsonb,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ApplicantId" integer NOT NULL,
    "JobId" integer
);


--
-- Name: ApplicationDrafts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ApplicationDrafts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ApplicationDrafts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ApplicationDrafts_id_seq" OWNED BY "ApplicationDrafts".id;


--
-- Name: Applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Applications" (
    id integer NOT NULL,
    note text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ApplicantId" integer NOT NULL,
    "JobId" integer NOT NULL,
    attachments jsonb,
    status "enum_Applications_status" DEFAULT 'NEW'::"enum_Applications_status" NOT NULL
);


--
-- Name: Applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Applications_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Applications_id_seq" OWNED BY "Applications".id;


--
-- Name: Bookmarks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Bookmarks" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer,
    "JobId" integer,
    "CompanyId" integer,
    "ResourceId" integer
);


--
-- Name: Bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Bookmarks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Bookmarks_id_seq" OWNED BY "Bookmarks".id;


--
-- Name: Careers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Careers" (
    id integer NOT NULL,
    code character varying(255),
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    overview text,
    title character varying(255),
    interview jsonb,
    secret jsonb,
    "bannerPic" character varying(255)
);


--
-- Name: Careers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Careers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Careers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Careers_id_seq" OWNED BY "Careers".id;


--
-- Name: Cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Cities" (
    id integer NOT NULL,
    name character varying(255),
    "CountryCode" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Cities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Cities_id_seq" OWNED BY "Cities".id;


--
-- Name: Companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Companies" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    logo character varying(255),
    city character varying(255),
    tagline character varying(255),
    description text,
    video character varying(255),
    website character varying(255),
    "socialMediaSites" jsonb,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CountryCode" character varying(255),
    "IndustryId" integer,
    "bannerPic" character varying(255),
    "descriptionV2" jsonb,
    "planValidUntil" timestamp with time zone,
    "isVerified" boolean DEFAULT false NOT NULL,
    "PlanId" integer,
    "isHiring" boolean DEFAULT false NOT NULL,
    "isProvidingResource" boolean DEFAULT false NOT NULL,
    "stripeCustomerId" character varying(255),
    "localOffice" boolean DEFAULT true NOT NULL,
    "customAttributes" jsonb,
    photos jsonb,
    "descriptionRaw" jsonb,
    "descriptionHTML" text,
    "descriptionMarkDown" text,
    "CityId" integer
);


--
-- Name: Companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Companies_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Companies_id_seq" OWNED BY "Companies".id;


--
-- Name: CompanyDrafts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "CompanyDrafts" (
    id integer NOT NULL,
    name character varying(255),
    logo character varying(255),
    "bannerPic" character varying(255),
    city character varying(255),
    tagline character varying(255),
    description text,
    "descriptionV2" json,
    video character varying(255),
    website character varying(255),
    "socialMediaSites" json,
    "isHiring" boolean DEFAULT false NOT NULL,
    "isProvidingResource" boolean DEFAULT false NOT NULL,
    "localOffice" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CountryCode" character varying(255),
    "IndustryId" integer,
    "CreatorId" integer NOT NULL,
    "PublishId" integer
);


--
-- Name: CompanyDrafts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "CompanyDrafts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: CompanyDrafts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "CompanyDrafts_id_seq" OWNED BY "CompanyDrafts".id;


--
-- Name: Countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Countries" (
    code character varying(255) NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    demonym character varying(255),
    currency jsonb,
    languages jsonb
);


--
-- Name: Degrees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Degrees" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Degrees_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Degrees_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Degrees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Degrees_id_seq" OWNED BY "Degrees".id;


--
-- Name: Entitlements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Entitlements" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ApplicationId" integer,
    "CompanyId" integer,
    "JobId" integer
);


--
-- Name: Entitlements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Entitlements_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Entitlements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Entitlements_id_seq" OWNED BY "Entitlements".id;


--
-- Name: Events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Events" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "startDate" timestamp with time zone,
    "endDate" timestamp with time zone,
    description text NOT NULL,
    "registrationLink" character varying(255),
    price integer,
    currency "enum_Events_currency",
    capacity integer,
    "isOnline" boolean,
    "bannerPic" character varying(255),
    address character varying(255),
    "isPublic" boolean DEFAULT true NOT NULL,
    "CompanyId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Events_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Events_id_seq" OWNED BY "Events".id;


--
-- Name: Experiences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Experiences" (
    id integer NOT NULL,
    title character varying(255),
    notes text,
    "startDate" timestamp with time zone,
    "endDate" timestamp with time zone,
    organization character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    type "enum_Experiences_type" NOT NULL,
    degree character varying(255),
    institution character varying(255),
    activity character varying(255),
    achievement character varying(255),
    "UserId" integer,
    "SchoolId" integer,
    "DegreeId" integer,
    "StudyId" integer
);


--
-- Name: Experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Experiences_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Experiences_id_seq" OWNED BY "Experiences".id;


--
-- Name: Follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Follows" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer,
    "CareerId" integer,
    "ProfessionId" integer
);


--
-- Name: Follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Follows_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Follows_id_seq" OWNED BY "Follows".id;


--
-- Name: GroupEvents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "GroupEvents" (
    id integer NOT NULL,
    status "enum_GroupEvents_status" DEFAULT 'PENDING'::"enum_GroupEvents_status" NOT NULL,
    "approvalDate" timestamp with time zone,
    "GroupId" integer,
    "EventId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: GroupEvents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "GroupEvents_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: GroupEvents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "GroupEvents_id_seq" OWNED BY "GroupEvents".id;


--
-- Name: GroupJobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "GroupJobs" (
    id integer NOT NULL,
    status "enum_GroupJobs_status" DEFAULT 'PENDING'::"enum_GroupJobs_status" NOT NULL,
    "approvalDate" timestamp with time zone,
    "GroupId" integer,
    "JobId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: GroupJobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "GroupJobs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: GroupJobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "GroupJobs_id_seq" OWNED BY "GroupJobs".id;


--
-- Name: GroupMembers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "GroupMembers" (
    id integer NOT NULL,
    status "enum_GroupMembers_status" DEFAULT 'PENDING'::"enum_GroupMembers_status" NOT NULL,
    "approvalDate" timestamp with time zone,
    note text,
    "GroupId" integer,
    "AdminId" integer,
    "CompanyId" integer,
    "CandidateId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: GroupMembers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "GroupMembers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: GroupMembers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "GroupMembers_id_seq" OWNED BY "GroupMembers".id;


--
-- Name: Groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Groups" (
    id integer NOT NULL,
    subdomain character varying(255),
    name character varying(255),
    intro text,
    logo character varying(255),
    "bannerPic" character varying(255),
    features jsonb,
    type "enum_Groups_type" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Groups_id_seq" OWNED BY "Groups".id;


--
-- Name: Identities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Identities" (
    id character varying(255) NOT NULL,
    token text,
    type "enum_Identities_type" NOT NULL,
    email character varying(255),
    "firstName" character varying(255),
    "lastName" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer
);


--
-- Name: Industries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Industries" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "group" character varying(255),
    overview text
);


--
-- Name: Industries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Industries_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Industries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Industries_id_seq" OWNED BY "Industries".id;


--
-- Name: Invites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Invites" (
    id integer NOT NULL,
    note text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CandidateId" integer NOT NULL,
    "JobId" integer NOT NULL,
    "SenderId" integer,
    status "enum_Invites_status" DEFAULT 'PENDING'::"enum_Invites_status" NOT NULL,
    token character varying(255),
    "tokenExpiry" date
);


--
-- Name: Invites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Invites_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Invites_id_seq" OWNED BY "Invites".id;


--
-- Name: JobCategories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobCategories" (
    id integer NOT NULL,
    name character varying(255),
    "bannerPic" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "customGroupJobCategories" jsonb DEFAULT '{}'::jsonb,
    banner_pic character varying
);


--
-- Name: JobCategories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobCategories_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobCategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobCategories_id_seq" OWNED BY "JobCategories".id;


--
-- Name: JobCategorySkills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobCategorySkills" (
    id integer NOT NULL,
    "JobCategoryId" integer,
    "SkillId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: JobCategorySkills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobCategorySkills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobCategorySkills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobCategorySkills_id_seq" OWNED BY "JobCategorySkills".id;


--
-- Name: JobDrafts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobDrafts" (
    id integer NOT NULL,
    title character varying(255),
    status "enum_JobDrafts_status",
    deadline timestamp with time zone,
    description text,
    "descriptionV2" jsonb,
    "bannerPic" character varying(255),
    intro character varying(255),
    location character varying(255),
    type "enum_JobDrafts_type",
    "durationLegacy" character varying(255),
    "salaryLegacy" character varying(255),
    attachments jsonb DEFAULT '[]'::jsonb NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CareerId" integer,
    "ProfessionId" integer,
    "CreatorId" integer NOT NULL,
    "CompanyId" integer NOT NULL,
    "PublishId" integer,
    "numberOfHires" integer DEFAULT 1 NOT NULL,
    "JobCategoryId" integer,
    "isRemote" boolean DEFAULT false NOT NULL,
    "descriptionRaw" jsonb,
    "descriptionHTML" text,
    "descriptionMarkDown" text,
    "CityId" integer,
    "CountryCode" character varying(255)
);


--
-- Name: JobDrafts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobDrafts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobDrafts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobDrafts_id_seq" OWNED BY "JobDrafts".id;


--
-- Name: JobJobTitleDrafts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobJobTitleDrafts" (
    id integer NOT NULL,
    "JobDraftId" integer,
    "JobTitleId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: JobJobTitleDrafts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobJobTitleDrafts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobJobTitleDrafts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobJobTitleDrafts_id_seq" OWNED BY "JobJobTitleDrafts".id;


--
-- Name: JobJobTitles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobJobTitles" (
    id integer NOT NULL,
    "JobId" integer,
    "JobTitleId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: JobJobTitles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobJobTitles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobJobTitles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobJobTitles_id_seq" OWNED BY "JobJobTitles".id;


--
-- Name: JobLocationPreferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobLocationPreferences" (
    id integer NOT NULL,
    "needsVisa" boolean,
    "CountryCode" character varying(255),
    "UserId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: JobLocationPreferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobLocationPreferences_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobLocationPreferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobLocationPreferences_id_seq" OWNED BY "JobLocationPreferences".id;


--
-- Name: JobRolePreferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobRolePreferences" (
    id integer NOT NULL,
    experience integer,
    "JobCategoryId" integer,
    "JobTitleId" integer,
    "UserId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: JobRolePreferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobRolePreferences_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobRolePreferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobRolePreferences_id_seq" OWNED BY "JobRolePreferences".id;


--
-- Name: JobSalaries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobSalaries" (
    id integer NOT NULL,
    "JobId" integer NOT NULL,
    "salaryType" "enum_JobSalaries_salaryType" DEFAULT 'BASIC'::"enum_JobSalaries_salaryType" NOT NULL,
    "salaryMode" "enum_JobSalaries_salaryMode" DEFAULT 'MONTH'::"enum_JobSalaries_salaryMode" NOT NULL,
    "minAmount" integer NOT NULL,
    "maxAmount" integer,
    currency "enum_JobSalaries_currency" DEFAULT 'SGD'::"enum_JobSalaries_currency" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: JobSalaries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobSalaries_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobSalaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobSalaries_id_seq" OWNED BY "JobSalaries".id;


--
-- Name: JobSalaryDrafts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobSalaryDrafts" (
    id integer NOT NULL,
    "JobDraftId" integer NOT NULL,
    "salaryType" "enum_JobSalaryDrafts_salaryType" DEFAULT 'BASIC'::"enum_JobSalaryDrafts_salaryType",
    "salaryMode" "enum_JobSalaryDrafts_salaryMode" DEFAULT 'MONTH'::"enum_JobSalaryDrafts_salaryMode",
    "minAmount" integer,
    "maxAmount" integer,
    currency "enum_JobSalaryDrafts_currency" DEFAULT 'SGD'::"enum_JobSalaryDrafts_currency",
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: JobSalaryDrafts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobSalaryDrafts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobSalaryDrafts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobSalaryDrafts_id_seq" OWNED BY "JobSalaryDrafts".id;


--
-- Name: JobSkillDrafts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobSkillDrafts" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "JobDraftId" integer,
    "SkillId" integer
);


--
-- Name: JobSkillDrafts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobSkillDrafts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobSkillDrafts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobSkillDrafts_id_seq" OWNED BY "JobSkillDrafts".id;


--
-- Name: JobSkills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobSkills" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "JobId" integer,
    "SkillId" integer
);


--
-- Name: JobSkills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobSkills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobSkills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobSkills_id_seq" OWNED BY "JobSkills".id;


--
-- Name: JobTags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobTags" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "JobId" integer,
    "TagId" character varying(255)
);


--
-- Name: JobTags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobTags_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobTags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobTags_id_seq" OWNED BY "JobTags".id;


--
-- Name: JobTitleSkills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobTitleSkills" (
    id integer NOT NULL,
    "JobTitleId" integer,
    "SkillId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: JobTitleSkills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobTitleSkills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobTitleSkills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobTitleSkills_id_seq" OWNED BY "JobTitleSkills".id;


--
-- Name: JobTitles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "JobTitles" (
    id integer NOT NULL,
    name character varying(255),
    "bannerPic" character varying(255),
    "JobCategoryId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    banner_pic character varying
);


--
-- Name: JobTitles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "JobTitles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: JobTitles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "JobTitles_id_seq" OWNED BY "JobTitles".id;


--
-- Name: Jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Jobs" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    status "enum_Jobs_status" NOT NULL,
    deadline timestamp with time zone,
    description text,
    "bannerPic" character varying(255),
    intro character varying(255),
    location character varying(255),
    jobtype "enum_Jobs_type" NOT NULL,
    "durationLegacy" character varying(255),
    "salaryLegacy" character varying(255),
    attachments jsonb DEFAULT '[]'::jsonb NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CreatorId" integer NOT NULL,
    "CompanyId" integer NOT NULL,
    "descriptionV2" jsonb,
    "ReviewerId" integer,
    "reviewedDate" date,
    "CareerId" integer,
    "draftId" integer,
    "ProfessionId" integer,
    "numberOfHires" integer DEFAULT 1 NOT NULL,
    "isPublic" boolean DEFAULT true NOT NULL,
    "JobCategoryId" integer,
    "isRemote" boolean DEFAULT false NOT NULL,
    "descriptionRaw" jsonb,
    "descriptionHTML" text,
    "descriptionMarkDown" text,
    "CityId" integer,
    "CountryCode" character varying(255)
);


--
-- Name: Jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Jobs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Jobs_id_seq" OWNED BY "Jobs".id;


--
-- Name: PendingSkills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "PendingSkills" (
    id integer NOT NULL,
    name character varying(255),
    status "enum_PendingSkills_status" DEFAULT 'PENDING'::"enum_PendingSkills_status" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "SuggesterId" integer,
    "EvaluatorId" integer
);


--
-- Name: PendingSkills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "PendingSkills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: PendingSkills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "PendingSkills_id_seq" OWNED BY "PendingSkills".id;


--
-- Name: PerkClaims; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "PerkClaims" (
    id integer NOT NULL,
    "voucherCode" character varying(255) NOT NULL,
    status "enum_PerkClaims_status" DEFAULT 'AVAILABLE'::"enum_PerkClaims_status" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "PerkId" integer NOT NULL,
    "UserId" integer NOT NULL
);


--
-- Name: PerkClaims_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "PerkClaims_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: PerkClaims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "PerkClaims_id_seq" OWNED BY "PerkClaims".id;


--
-- Name: Perks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Perks" (
    id integer NOT NULL,
    information json,
    "voucherType" "enum_Perks_voucherType" NOT NULL,
    point integer NOT NULL,
    "voucherCode" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CompanyId" integer
);


--
-- Name: Perks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Perks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Perks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Perks_id_seq" OWNED BY "Perks".id;


--
-- Name: Plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Plans" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    amount integer NOT NULL,
    currency character varying(255) DEFAULT 'SGD'::character varying NOT NULL,
    "interval" "enum_Plans_interval" NOT NULL,
    "intervalCount" integer DEFAULT 1,
    metadata jsonb,
    "statementDescriptor" character varying(255),
    "trialPeriodDays" integer,
    features jsonb NOT NULL,
    "stripeId" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Plans_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Plans_id_seq" OWNED BY "Plans".id;


--
-- Name: Points; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Points" (
    name character varying(255) NOT NULL,
    value integer DEFAULT 5 NOT NULL,
    type "enum_Points_type" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Preferences" (
    id integer NOT NULL,
    "salaryLatest" integer,
    "salaryExpectation" integer,
    currency "enum_Preferences_currency",
    internship boolean,
    "fullTime" boolean,
    "partTime" boolean,
    "projectBased" boolean,
    "UserId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Preferences_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Preferences_id_seq" OWNED BY "Preferences".id;


--
-- Name: ProfessionSkills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ProfessionSkills" (
    id integer NOT NULL,
    weightage integer DEFAULT 1 NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ProfessionId" integer,
    "SkillId" integer
);


--
-- Name: ProfessionSkills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ProfessionSkills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ProfessionSkills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ProfessionSkills_id_seq" OWNED BY "ProfessionSkills".id;


--
-- Name: Professions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Professions" (
    id integer NOT NULL,
    name character varying(255),
    "aDayInLife" jsonb,
    overview text,
    "bannerPic" character varying(255),
    "juniorAvgSalary" integer,
    "juniorMinSalary" integer,
    "juniorMaxSalary" integer,
    "midAvgSalary" integer,
    "midMinSalary" integer,
    "midMaxSalary" integer,
    "seniorAvgSalary" integer,
    "seniorMinSalary" integer,
    "seniorMaxSalary" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CareerId" integer
);


--
-- Name: Professions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Professions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Professions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Professions_id_seq" OWNED BY "Professions".id;


--
-- Name: ProfileExperiences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ProfileExperiences" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ProfileId" integer,
    "ExperienceId" integer
);


--
-- Name: ProfileExperiences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ProfileExperiences_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ProfileExperiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ProfileExperiences_id_seq" OWNED BY "ProfileExperiences".id;


--
-- Name: ProfileSkills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ProfileSkills" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ProfileId" integer,
    "UserSkillId" integer
);


--
-- Name: ProfileSkills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ProfileSkills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ProfileSkills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ProfileSkills_id_seq" OWNED BY "ProfileSkills".id;


--
-- Name: Profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Profiles" (
    id integer NOT NULL,
    label character varying(255),
    intro text,
    "profilePic" character varying(255),
    resume character varying(255),
    portfolio character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer
);


--
-- Name: Profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Profiles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Profiles_id_seq" OWNED BY "Profiles".id;


--
-- Name: ResourceSkills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ResourceSkills" (
    id integer NOT NULL,
    weightage integer DEFAULT 1 NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ResourceId" integer,
    "SkillId" integer
);


--
-- Name: ResourceSkills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ResourceSkills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ResourceSkills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ResourceSkills_id_seq" OWNED BY "ResourceSkills".id;


--
-- Name: Resources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Resources" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    type "enum_Resources_type" NOT NULL,
    url text NOT NULL,
    description jsonb,
    location character varying(255),
    price integer,
    "startDate" timestamp with time zone,
    "endDate" timestamp with time zone,
    source character varying(255),
    "isOnline" boolean DEFAULT true NOT NULL,
    "isFullTime" boolean DEFAULT false NOT NULL,
    "isPartTime" boolean DEFAULT false NOT NULL,
    area character varying(255),
    provider jsonb,
    "bannerPic" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CreatorId" integer,
    "CareerId" integer,
    "Currency" character varying(255)
);


--
-- Name: Resources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Resources_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Resources_id_seq" OWNED BY "Resources".id;


--
-- Name: SchoolCourses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "SchoolCourses" (
    id integer NOT NULL,
    "SchoolId" integer NOT NULL,
    "DegreeId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: SchoolCourses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "SchoolCourses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: SchoolCourses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "SchoolCourses_id_seq" OWNED BY "SchoolCourses".id;


--
-- Name: Schools; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Schools" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    domain character varying(255),
    website character varying(255),
    state character varying(255),
    "CountryCode" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Schools_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Schools_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Schools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Schools_id_seq" OWNED BY "Schools".id;


--
-- Name: Scores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Scores" (
    id integer NOT NULL,
    "userScore" integer,
    "companyScore" integer,
    "UserId" integer,
    "CompanyId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Scores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Scores_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Scores_id_seq" OWNED BY "Scores".id;


--
-- Name: Skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Skills" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Skills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Skills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Skills_id_seq" OWNED BY "Skills".id;


--
-- Name: Studies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Studies" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Studies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Studies_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Studies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Studies_id_seq" OWNED BY "Studies".id;


--
-- Name: Tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Tags" (
    id character varying(255) NOT NULL,
    features jsonb,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: UserCompanies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "UserCompanies" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer NOT NULL,
    "CompanyId" integer NOT NULL,
    role "enum_UserCompanies_role" DEFAULT 'ADMIN'::"enum_UserCompanies_role" NOT NULL
);


--
-- Name: UserCompanies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "UserCompanies_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserCompanies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "UserCompanies_id_seq" OWNED BY "UserCompanies".id;


--
-- Name: UserSkills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "UserSkills" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer,
    "SkillId" integer,
    level integer DEFAULT 2 NOT NULL
);


--
-- Name: UserSkills_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "UserSkills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserSkills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "UserSkills_id_seq" OWNED BY "UserSkills".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "passwordResetToken" character varying(255),
    "passwordResetTokenExpiry" timestamp with time zone,
    preferences jsonb,
    "firstName" character varying(255),
    "lastName" character varying(255),
    city character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CountryCode" character varying(255),
    phone character varying(255),
    "birthDate" date,
    "Nationality" character varying(255),
    "lastSeen" timestamp with time zone,
    "emailVerificationToken" character varying(255),
    "emailVerificationTokenExpiry" date,
    referral character varying(255),
    "preferredLanguage" character varying(255),
    intro text,
    resume character varying(255),
    "profilePic" character varying(255),
    portfolio jsonb,
    role "enum_Users_role" DEFAULT 'CANDIDATE'::"enum_Users_role" NOT NULL,
    gender "enum_Users_gender",
    race "enum_Users_race",
    "educationLevel" "enum_Users_educationLevel",
    "isSGPR" boolean,
    "isEmployed" boolean,
    "yearsOfWorking" integer,
    nric character varying(255),
    "isPublic" boolean DEFAULT false NOT NULL,
    slug character varying(255),
    "CityId" integer
);


--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- Name: application_scores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE application_scores (
    id bigint NOT NULL,
    application_id bigint,
    job_id bigint,
    ascore numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: application_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE application_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: application_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE application_scores_id_seq OWNED BY application_scores.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bookmark_scores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bookmark_scores (
    id bigint NOT NULL,
    bookmark_id bigint,
    job_id bigint,
    bscore numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bookmark_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bookmark_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bookmark_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bookmark_scores_id_seq OWNED BY bookmark_scores.id;


--
-- Name: category_scores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE category_scores (
    id bigint NOT NULL,
    job_category_id bigint,
    job_id bigint,
    cscore numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: category_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE category_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: category_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE category_scores_id_seq OWNED BY category_scores.id;


--
-- Name: records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE records (
    id bigint NOT NULL,
    user_id bigint,
    job_id bigint,
    jobrec_id bigint,
    savedscore numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE records_id_seq OWNED BY records.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: skill_scores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE skill_scores (
    id bigint NOT NULL,
    user_skill_id bigint,
    job_skill_id bigint,
    job_id bigint,
    sscore numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: skill_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE skill_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: skill_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE skill_scores_id_seq OWNED BY skill_scores.id;


SET search_path = analytics, pg_catalog;

--
-- Name: ActionLogSummary id; Type: DEFAULT; Schema: analytics; Owner: -
--

ALTER TABLE ONLY "ActionLogSummary" ALTER COLUMN id SET DEFAULT nextval('action_logs_summary_id_seq'::regclass);


--
-- Name: ActiveUserSummary id; Type: DEFAULT; Schema: analytics; Owner: -
--

ALTER TABLE ONLY "ActiveUserSummary" ALTER COLUMN id SET DEFAULT nextval('"ActiveUserSummary_id_seq"'::regclass);


--
-- Name: ApplicationViewSummary id; Type: DEFAULT; Schema: analytics; Owner: -
--

ALTER TABLE ONLY "ApplicationViewSummary" ALTER COLUMN id SET DEFAULT nextval('"ApplicationViewSummary_id_seq"'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: ActionLogs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ActionLogs" ALTER COLUMN id SET DEFAULT nextval('"ActionLogs_id_seq"'::regclass);


--
-- Name: ApplicationDrafts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ApplicationDrafts" ALTER COLUMN id SET DEFAULT nextval('"ApplicationDrafts_id_seq"'::regclass);


--
-- Name: Applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Applications" ALTER COLUMN id SET DEFAULT nextval('"Applications_id_seq"'::regclass);


--
-- Name: Bookmarks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Bookmarks" ALTER COLUMN id SET DEFAULT nextval('"Bookmarks_id_seq"'::regclass);


--
-- Name: Careers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Careers" ALTER COLUMN id SET DEFAULT nextval('"Careers_id_seq"'::regclass);


--
-- Name: Cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Cities" ALTER COLUMN id SET DEFAULT nextval('"Cities_id_seq"'::regclass);


--
-- Name: Companies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Companies" ALTER COLUMN id SET DEFAULT nextval('"Companies_id_seq"'::regclass);


--
-- Name: CompanyDrafts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CompanyDrafts" ALTER COLUMN id SET DEFAULT nextval('"CompanyDrafts_id_seq"'::regclass);


--
-- Name: Degrees id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Degrees" ALTER COLUMN id SET DEFAULT nextval('"Degrees_id_seq"'::regclass);


--
-- Name: Entitlements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Entitlements" ALTER COLUMN id SET DEFAULT nextval('"Entitlements_id_seq"'::regclass);


--
-- Name: Events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Events" ALTER COLUMN id SET DEFAULT nextval('"Events_id_seq"'::regclass);


--
-- Name: Experiences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Experiences" ALTER COLUMN id SET DEFAULT nextval('"Experiences_id_seq"'::regclass);


--
-- Name: Follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Follows" ALTER COLUMN id SET DEFAULT nextval('"Follows_id_seq"'::regclass);


--
-- Name: GroupEvents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupEvents" ALTER COLUMN id SET DEFAULT nextval('"GroupEvents_id_seq"'::regclass);


--
-- Name: GroupJobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupJobs" ALTER COLUMN id SET DEFAULT nextval('"GroupJobs_id_seq"'::regclass);


--
-- Name: GroupMembers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupMembers" ALTER COLUMN id SET DEFAULT nextval('"GroupMembers_id_seq"'::regclass);


--
-- Name: Groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Groups" ALTER COLUMN id SET DEFAULT nextval('"Groups_id_seq"'::regclass);


--
-- Name: Industries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Industries" ALTER COLUMN id SET DEFAULT nextval('"Industries_id_seq"'::regclass);


--
-- Name: Invites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Invites" ALTER COLUMN id SET DEFAULT nextval('"Invites_id_seq"'::regclass);


--
-- Name: JobCategories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobCategories" ALTER COLUMN id SET DEFAULT nextval('"JobCategories_id_seq"'::regclass);


--
-- Name: JobCategorySkills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobCategorySkills" ALTER COLUMN id SET DEFAULT nextval('"JobCategorySkills_id_seq"'::regclass);


--
-- Name: JobDrafts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobDrafts" ALTER COLUMN id SET DEFAULT nextval('"JobDrafts_id_seq"'::regclass);


--
-- Name: JobJobTitleDrafts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobJobTitleDrafts" ALTER COLUMN id SET DEFAULT nextval('"JobJobTitleDrafts_id_seq"'::regclass);


--
-- Name: JobJobTitles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobJobTitles" ALTER COLUMN id SET DEFAULT nextval('"JobJobTitles_id_seq"'::regclass);


--
-- Name: JobLocationPreferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobLocationPreferences" ALTER COLUMN id SET DEFAULT nextval('"JobLocationPreferences_id_seq"'::regclass);


--
-- Name: JobRolePreferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobRolePreferences" ALTER COLUMN id SET DEFAULT nextval('"JobRolePreferences_id_seq"'::regclass);


--
-- Name: JobSalaries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSalaries" ALTER COLUMN id SET DEFAULT nextval('"JobSalaries_id_seq"'::regclass);


--
-- Name: JobSalaryDrafts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSalaryDrafts" ALTER COLUMN id SET DEFAULT nextval('"JobSalaryDrafts_id_seq"'::regclass);


--
-- Name: JobSkillDrafts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSkillDrafts" ALTER COLUMN id SET DEFAULT nextval('"JobSkillDrafts_id_seq"'::regclass);


--
-- Name: JobSkills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSkills" ALTER COLUMN id SET DEFAULT nextval('"JobSkills_id_seq"'::regclass);


--
-- Name: JobTags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTags" ALTER COLUMN id SET DEFAULT nextval('"JobTags_id_seq"'::regclass);


--
-- Name: JobTitleSkills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTitleSkills" ALTER COLUMN id SET DEFAULT nextval('"JobTitleSkills_id_seq"'::regclass);


--
-- Name: JobTitles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTitles" ALTER COLUMN id SET DEFAULT nextval('"JobTitles_id_seq"'::regclass);


--
-- Name: Jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Jobs" ALTER COLUMN id SET DEFAULT nextval('"Jobs_id_seq"'::regclass);


--
-- Name: PendingSkills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PendingSkills" ALTER COLUMN id SET DEFAULT nextval('"PendingSkills_id_seq"'::regclass);


--
-- Name: PerkClaims id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PerkClaims" ALTER COLUMN id SET DEFAULT nextval('"PerkClaims_id_seq"'::regclass);


--
-- Name: Perks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Perks" ALTER COLUMN id SET DEFAULT nextval('"Perks_id_seq"'::regclass);


--
-- Name: Plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Plans" ALTER COLUMN id SET DEFAULT nextval('"Plans_id_seq"'::regclass);


--
-- Name: Preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Preferences" ALTER COLUMN id SET DEFAULT nextval('"Preferences_id_seq"'::regclass);


--
-- Name: ProfessionSkills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfessionSkills" ALTER COLUMN id SET DEFAULT nextval('"ProfessionSkills_id_seq"'::regclass);


--
-- Name: Professions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Professions" ALTER COLUMN id SET DEFAULT nextval('"Professions_id_seq"'::regclass);


--
-- Name: ProfileExperiences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfileExperiences" ALTER COLUMN id SET DEFAULT nextval('"ProfileExperiences_id_seq"'::regclass);


--
-- Name: ProfileSkills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfileSkills" ALTER COLUMN id SET DEFAULT nextval('"ProfileSkills_id_seq"'::regclass);


--
-- Name: Profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Profiles" ALTER COLUMN id SET DEFAULT nextval('"Profiles_id_seq"'::regclass);


--
-- Name: ResourceSkills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ResourceSkills" ALTER COLUMN id SET DEFAULT nextval('"ResourceSkills_id_seq"'::regclass);


--
-- Name: Resources id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Resources" ALTER COLUMN id SET DEFAULT nextval('"Resources_id_seq"'::regclass);


--
-- Name: SchoolCourses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SchoolCourses" ALTER COLUMN id SET DEFAULT nextval('"SchoolCourses_id_seq"'::regclass);


--
-- Name: Schools id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Schools" ALTER COLUMN id SET DEFAULT nextval('"Schools_id_seq"'::regclass);


--
-- Name: Scores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Scores" ALTER COLUMN id SET DEFAULT nextval('"Scores_id_seq"'::regclass);


--
-- Name: Skills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Skills" ALTER COLUMN id SET DEFAULT nextval('"Skills_id_seq"'::regclass);


--
-- Name: Studies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Studies" ALTER COLUMN id SET DEFAULT nextval('"Studies_id_seq"'::regclass);


--
-- Name: UserCompanies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserCompanies" ALTER COLUMN id SET DEFAULT nextval('"UserCompanies_id_seq"'::regclass);


--
-- Name: UserSkills id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserSkills" ALTER COLUMN id SET DEFAULT nextval('"UserSkills_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Name: application_scores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY application_scores ALTER COLUMN id SET DEFAULT nextval('application_scores_id_seq'::regclass);


--
-- Name: bookmark_scores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bookmark_scores ALTER COLUMN id SET DEFAULT nextval('bookmark_scores_id_seq'::regclass);


--
-- Name: category_scores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY category_scores ALTER COLUMN id SET DEFAULT nextval('category_scores_id_seq'::regclass);


--
-- Name: records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY records ALTER COLUMN id SET DEFAULT nextval('records_id_seq'::regclass);


--
-- Name: skill_scores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY skill_scores ALTER COLUMN id SET DEFAULT nextval('skill_scores_id_seq'::regclass);


SET search_path = analytics, pg_catalog;

--
-- Name: ActiveUserSummary ActiveUserSummary_pkey; Type: CONSTRAINT; Schema: analytics; Owner: -
--

ALTER TABLE ONLY "ActiveUserSummary"
    ADD CONSTRAINT "ActiveUserSummary_pkey" PRIMARY KEY (id);


--
-- Name: ApplicationViewSummary ApplicationViewSummary_pkey; Type: CONSTRAINT; Schema: analytics; Owner: -
--

ALTER TABLE ONLY "ApplicationViewSummary"
    ADD CONSTRAINT "ApplicationViewSummary_pkey" PRIMARY KEY (id);


--
-- Name: ActionLogSummary action_logs_summary_pkey; Type: CONSTRAINT; Schema: analytics; Owner: -
--

ALTER TABLE ONLY "ActionLogSummary"
    ADD CONSTRAINT action_logs_summary_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- Name: ActionLogs ActionLogs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ActionLogs"
    ADD CONSTRAINT "ActionLogs_pkey" PRIMARY KEY (id);


--
-- Name: ApiClients ApiClients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ApiClients"
    ADD CONSTRAINT "ApiClients_pkey" PRIMARY KEY (id);


--
-- Name: ApplicationDrafts ApplicationDrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ApplicationDrafts"
    ADD CONSTRAINT "ApplicationDrafts_pkey" PRIMARY KEY (id);


--
-- Name: Applications Applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Applications"
    ADD CONSTRAINT "Applications_pkey" PRIMARY KEY (id);


--
-- Name: Bookmarks Bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Bookmarks"
    ADD CONSTRAINT "Bookmarks_pkey" PRIMARY KEY (id);


--
-- Name: Careers Careers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Careers"
    ADD CONSTRAINT "Careers_pkey" PRIMARY KEY (id);


--
-- Name: Cities Cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Cities"
    ADD CONSTRAINT "Cities_pkey" PRIMARY KEY (id);


--
-- Name: Companies Companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Companies"
    ADD CONSTRAINT "Companies_pkey" PRIMARY KEY (id);


--
-- Name: CompanyDrafts CompanyDrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CompanyDrafts"
    ADD CONSTRAINT "CompanyDrafts_pkey" PRIMARY KEY (id);


--
-- Name: Countries Countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Countries"
    ADD CONSTRAINT "Countries_pkey" PRIMARY KEY (code);


--
-- Name: Degrees Degrees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Degrees"
    ADD CONSTRAINT "Degrees_pkey" PRIMARY KEY (id);


--
-- Name: Entitlements Entitlements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Entitlements"
    ADD CONSTRAINT "Entitlements_pkey" PRIMARY KEY (id);


--
-- Name: Events Events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Events"
    ADD CONSTRAINT "Events_pkey" PRIMARY KEY (id);


--
-- Name: Experiences Experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Experiences"
    ADD CONSTRAINT "Experiences_pkey" PRIMARY KEY (id);


--
-- Name: Follows Follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Follows"
    ADD CONSTRAINT "Follows_pkey" PRIMARY KEY (id);


--
-- Name: GroupEvents GroupEvents_GroupId_EventId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupEvents"
    ADD CONSTRAINT "GroupEvents_GroupId_EventId_key" UNIQUE ("GroupId", "EventId");


--
-- Name: GroupEvents GroupEvents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupEvents"
    ADD CONSTRAINT "GroupEvents_pkey" PRIMARY KEY (id);


--
-- Name: GroupJobs GroupJobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupJobs"
    ADD CONSTRAINT "GroupJobs_pkey" PRIMARY KEY (id);


--
-- Name: GroupMembers GroupMembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupMembers"
    ADD CONSTRAINT "GroupMembers_pkey" PRIMARY KEY (id);


--
-- Name: Groups Groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Groups"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);


--
-- Name: Identities Identities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Identities"
    ADD CONSTRAINT "Identities_pkey" PRIMARY KEY (id, type);


--
-- Name: Industries Industries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Industries"
    ADD CONSTRAINT "Industries_pkey" PRIMARY KEY (id);


--
-- Name: Invites Invites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Invites"
    ADD CONSTRAINT "Invites_pkey" PRIMARY KEY (id);


--
-- Name: JobCategories JobCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobCategories"
    ADD CONSTRAINT "JobCategories_pkey" PRIMARY KEY (id);


--
-- Name: JobCategorySkills JobCategorySkills_JobCategoryId_SkillId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobCategorySkills"
    ADD CONSTRAINT "JobCategorySkills_JobCategoryId_SkillId_key" UNIQUE ("JobCategoryId", "SkillId");


--
-- Name: JobCategorySkills JobCategorySkills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobCategorySkills"
    ADD CONSTRAINT "JobCategorySkills_pkey" PRIMARY KEY (id);


--
-- Name: JobDrafts JobDrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobDrafts"
    ADD CONSTRAINT "JobDrafts_pkey" PRIMARY KEY (id);


--
-- Name: JobJobTitleDrafts JobJobTitleDrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobJobTitleDrafts"
    ADD CONSTRAINT "JobJobTitleDrafts_pkey" PRIMARY KEY (id);


--
-- Name: JobJobTitles JobJobTitles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobJobTitles"
    ADD CONSTRAINT "JobJobTitles_pkey" PRIMARY KEY (id);


--
-- Name: JobLocationPreferences JobLocationPreferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobLocationPreferences"
    ADD CONSTRAINT "JobLocationPreferences_pkey" PRIMARY KEY (id);


--
-- Name: JobRolePreferences JobRolePreferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobRolePreferences"
    ADD CONSTRAINT "JobRolePreferences_pkey" PRIMARY KEY (id);


--
-- Name: JobSalaries JobSalaries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSalaries"
    ADD CONSTRAINT "JobSalaries_pkey" PRIMARY KEY (id);


--
-- Name: JobSalaryDrafts JobSalaryDrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSalaryDrafts"
    ADD CONSTRAINT "JobSalaryDrafts_pkey" PRIMARY KEY (id);


--
-- Name: JobSkillDrafts JobSkillDrafts_JobDraftId_SkillId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSkillDrafts"
    ADD CONSTRAINT "JobSkillDrafts_JobDraftId_SkillId_key" UNIQUE ("JobDraftId", "SkillId");


--
-- Name: JobSkillDrafts JobSkillDrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSkillDrafts"
    ADD CONSTRAINT "JobSkillDrafts_pkey" PRIMARY KEY (id);


--
-- Name: JobSkills JobSkills_JobId_SkillId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSkills"
    ADD CONSTRAINT "JobSkills_JobId_SkillId_key" UNIQUE ("JobId", "SkillId");


--
-- Name: JobSkills JobSkills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSkills"
    ADD CONSTRAINT "JobSkills_pkey" PRIMARY KEY (id);


--
-- Name: JobTags JobTags_JobId_TagId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTags"
    ADD CONSTRAINT "JobTags_JobId_TagId_key" UNIQUE ("JobId", "TagId");


--
-- Name: JobTags JobTags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTags"
    ADD CONSTRAINT "JobTags_pkey" PRIMARY KEY (id);


--
-- Name: JobTitleSkills JobTitleSkills_JobTitleId_SkillId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTitleSkills"
    ADD CONSTRAINT "JobTitleSkills_JobTitleId_SkillId_key" UNIQUE ("JobTitleId", "SkillId");


--
-- Name: JobTitleSkills JobTitleSkills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTitleSkills"
    ADD CONSTRAINT "JobTitleSkills_pkey" PRIMARY KEY (id);


--
-- Name: JobTitles JobTitles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTitles"
    ADD CONSTRAINT "JobTitles_pkey" PRIMARY KEY (id);


--
-- Name: Jobs Jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Jobs"
    ADD CONSTRAINT "Jobs_pkey" PRIMARY KEY (id);


--
-- Name: PendingSkills PendingSkills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PendingSkills"
    ADD CONSTRAINT "PendingSkills_pkey" PRIMARY KEY (id);


--
-- Name: PerkClaims PerkClaims_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PerkClaims"
    ADD CONSTRAINT "PerkClaims_pkey" PRIMARY KEY (id);


--
-- Name: Perks Perks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Perks"
    ADD CONSTRAINT "Perks_pkey" PRIMARY KEY (id);


--
-- Name: Plans Plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Plans"
    ADD CONSTRAINT "Plans_pkey" PRIMARY KEY (id);


--
-- Name: Points Points_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Points"
    ADD CONSTRAINT "Points_pkey" PRIMARY KEY (name);


--
-- Name: Preferences Preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Preferences"
    ADD CONSTRAINT "Preferences_pkey" PRIMARY KEY (id);


--
-- Name: ProfessionSkills ProfessionSkills_ProfessionId_SkillId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfessionSkills"
    ADD CONSTRAINT "ProfessionSkills_ProfessionId_SkillId_key" UNIQUE ("ProfessionId", "SkillId");


--
-- Name: ProfessionSkills ProfessionSkills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfessionSkills"
    ADD CONSTRAINT "ProfessionSkills_pkey" PRIMARY KEY (id);


--
-- Name: Professions Professions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Professions"
    ADD CONSTRAINT "Professions_pkey" PRIMARY KEY (id);


--
-- Name: ProfileExperiences ProfileExperiences_ProfileId_ExperienceId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfileExperiences"
    ADD CONSTRAINT "ProfileExperiences_ProfileId_ExperienceId_key" UNIQUE ("ProfileId", "ExperienceId");


--
-- Name: ProfileExperiences ProfileExperiences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfileExperiences"
    ADD CONSTRAINT "ProfileExperiences_pkey" PRIMARY KEY (id);


--
-- Name: ProfileSkills ProfileSkills_ProfileId_UserSkillId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfileSkills"
    ADD CONSTRAINT "ProfileSkills_ProfileId_UserSkillId_key" UNIQUE ("ProfileId", "UserSkillId");


--
-- Name: ProfileSkills ProfileSkills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfileSkills"
    ADD CONSTRAINT "ProfileSkills_pkey" PRIMARY KEY (id);


--
-- Name: Profiles Profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Profiles"
    ADD CONSTRAINT "Profiles_pkey" PRIMARY KEY (id);


--
-- Name: ResourceSkills ResourceSkills_ResourceId_SkillId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ResourceSkills"
    ADD CONSTRAINT "ResourceSkills_ResourceId_SkillId_key" UNIQUE ("ResourceId", "SkillId");


--
-- Name: ResourceSkills ResourceSkills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ResourceSkills"
    ADD CONSTRAINT "ResourceSkills_pkey" PRIMARY KEY (id);


--
-- Name: Resources Resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Resources"
    ADD CONSTRAINT "Resources_pkey" PRIMARY KEY (id);


--
-- Name: SchoolCourses SchoolCourses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SchoolCourses"
    ADD CONSTRAINT "SchoolCourses_pkey" PRIMARY KEY (id);


--
-- Name: Schools Schools_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Schools"
    ADD CONSTRAINT "Schools_pkey" PRIMARY KEY (id);


--
-- Name: Scores Scores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Scores"
    ADD CONSTRAINT "Scores_pkey" PRIMARY KEY (id);


--
-- Name: Skills Skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Skills"
    ADD CONSTRAINT "Skills_pkey" PRIMARY KEY (id);


--
-- Name: Studies Studies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Studies"
    ADD CONSTRAINT "Studies_pkey" PRIMARY KEY (id);


--
-- Name: Tags Tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY (id);


--
-- Name: UserCompanies UserCompanies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserCompanies"
    ADD CONSTRAINT "UserCompanies_pkey" PRIMARY KEY (id);


--
-- Name: UserSkills UserSkills_UserId_SkillId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserSkills"
    ADD CONSTRAINT "UserSkills_UserId_SkillId_key" UNIQUE ("UserId", "SkillId");


--
-- Name: UserSkills UserSkills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserSkills"
    ADD CONSTRAINT "UserSkills_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: application_scores application_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY application_scores
    ADD CONSTRAINT application_scores_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bookmark_scores bookmark_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bookmark_scores
    ADD CONSTRAINT bookmark_scores_pkey PRIMARY KEY (id);


--
-- Name: category_scores category_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY category_scores
    ADD CONSTRAINT category_scores_pkey PRIMARY KEY (id);


--
-- Name: records records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY records
    ADD CONSTRAINT records_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: skill_scores skill_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skill_scores
    ADD CONSTRAINT skill_scores_pkey PRIMARY KEY (id);


SET search_path = analytics, pg_catalog;

--
-- Name: ActiveUserSummary_userId_day_key; Type: INDEX; Schema: analytics; Owner: -
--

CREATE UNIQUE INDEX "ActiveUserSummary_userId_day_key" ON "ActiveUserSummary" USING btree ("userId", day);


SET search_path = public, pg_catalog;

--
-- Name: ActionLogs_action_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ActionLogs_action_idx" ON "ActionLogs" USING btree (action);


--
-- Name: ActionLogs_collection_object_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ActionLogs_collection_object_idx" ON "ActionLogs" USING btree (collection, object);


--
-- Name: Bookmarks_UserId_CompanyId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Bookmarks_UserId_CompanyId_key" ON "Bookmarks" USING btree ("UserId", "CompanyId");


--
-- Name: Bookmarks_UserId_JobId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Bookmarks_UserId_JobId_key" ON "Bookmarks" USING btree ("UserId", "JobId");


--
-- Name: Bookmarks_UserId_ResourceId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Bookmarks_UserId_ResourceId_key" ON "Bookmarks" USING btree ("UserId", "ResourceId");


--
-- Name: Follows_UserId_CareerId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Follows_UserId_CareerId_key" ON "Follows" USING btree ("UserId", "CareerId");


--
-- Name: Follows_UserId_ProfessionId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Follows_UserId_ProfessionId_key" ON "Follows" USING btree ("UserId", "ProfessionId");


--
-- Name: GroupJobs_JobId_GroupId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "GroupJobs_JobId_GroupId_idx" ON "GroupJobs" USING btree ("JobId", "GroupId");


--
-- Name: GroupJobs_JobId_GroupId_status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "GroupJobs_JobId_GroupId_status_idx" ON "GroupJobs" USING btree ("JobId", "GroupId", status);


--
-- Name: GroupMembers_AdminId_GroupId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "GroupMembers_AdminId_GroupId_idx" ON "GroupMembers" USING btree ("AdminId", "GroupId");


--
-- Name: GroupMembers_CandidateId_GroupId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "GroupMembers_CandidateId_GroupId_idx" ON "GroupMembers" USING btree ("CandidateId", "GroupId");


--
-- Name: GroupMembers_CandidateId_GroupId_status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "GroupMembers_CandidateId_GroupId_status_idx" ON "GroupMembers" USING btree ("CandidateId", "GroupId", status);


--
-- Name: GroupMembers_CompanyId_GroupId_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "GroupMembers_CompanyId_GroupId_idx" ON "GroupMembers" USING btree ("CompanyId", "GroupId");


--
-- Name: GroupMembers_CompanyId_GroupId_status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "GroupMembers_CompanyId_GroupId_status_idx" ON "GroupMembers" USING btree ("CompanyId", "GroupId", status);


--
-- Name: JobJobTitleDrafts_JobDraftId_JobTitleId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "JobJobTitleDrafts_JobDraftId_JobTitleId_key" ON "JobJobTitleDrafts" USING btree ("JobDraftId", "JobTitleId");


--
-- Name: JobJobTitles_JobId_JobTitleId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "JobJobTitles_JobId_JobTitleId_key" ON "JobJobTitles" USING btree ("JobId", "JobTitleId");


--
-- Name: JobLocationPreferences_UserId_CountryCode_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "JobLocationPreferences_UserId_CountryCode_key" ON "JobLocationPreferences" USING btree ("UserId", "CountryCode");


--
-- Name: JobRolePreferences_UserId_JobCategoryId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "JobRolePreferences_UserId_JobCategoryId_key" ON "JobRolePreferences" USING btree ("UserId", "JobCategoryId");


--
-- Name: JobRolePreferences_UserId_JobTitleId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "JobRolePreferences_UserId_JobTitleId_key" ON "JobRolePreferences" USING btree ("UserId", "JobTitleId");


--
-- Name: UserCompanies_UserId_CompanyId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UserCompanies_UserId_CompanyId_key" ON "UserCompanies" USING btree ("UserId", "CompanyId");


--
-- Name: Users_nric_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Users_nric_key" ON "Users" USING btree (nric);


--
-- Name: Users_slug_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Users_slug_key" ON "Users" USING btree (slug);


SET search_path = analytics, pg_catalog;

--
-- Name: ActionLogSummary recount_action_logs_summary; Type: TRIGGER; Schema: analytics; Owner: -
--

CREATE TRIGGER recount_action_logs_summary AFTER UPDATE OF flag_recount ON "ActionLogSummary" FOR EACH ROW WHEN ((new.flag_recount = true)) EXECUTE PROCEDURE recount_action_logs_summary();


--
-- Name: ApplicationViewSummary recount_application_view_summary; Type: TRIGGER; Schema: analytics; Owner: -
--

CREATE TRIGGER recount_application_view_summary AFTER UPDATE OF flag_recount ON "ApplicationViewSummary" FOR EACH ROW WHEN ((new.flag_recount = true)) EXECUTE PROCEDURE recount_application_view_summary();


SET search_path = public, pg_catalog;

--
-- Name: ActionLogs update_action_logs_summary; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_action_logs_summary AFTER INSERT OR UPDATE OF object, action, collection ON "ActionLogs" FOR EACH ROW WHEN (((new.object IS NOT NULL) AND (new.action IS NOT NULL) AND (new.collection IS NOT NULL))) EXECUTE PROCEDURE analytics.update_action_logs_summary();


--
-- Name: ActionLogs update_active_user_summary; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_active_user_summary AFTER INSERT ON "ActionLogs" FOR EACH ROW WHEN ((new."userId" IS NOT NULL)) EXECUTE PROCEDURE analytics.update_active_user_summary();


--
-- Name: ActionLogs update_application_view_summary; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_application_view_summary AFTER INSERT OR UPDATE OF object, action, collection, "userId" ON "ActionLogs" FOR EACH ROW WHEN (((new.object IS NOT NULL) AND (new.action = 'READ'::"enum_ActionLogs_action") AND ((new.collection)::text = 'applications'::text))) EXECUTE PROCEDURE analytics.update_application_view_summary();


--
-- Name: ApiClients ApiClients_CreatorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ApiClients"
    ADD CONSTRAINT "ApiClients_CreatorId_fkey" FOREIGN KEY ("CreatorId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ApplicationDrafts ApplicationDrafts_ApplicantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ApplicationDrafts"
    ADD CONSTRAINT "ApplicationDrafts_ApplicantId_fkey" FOREIGN KEY ("ApplicantId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ApplicationDrafts ApplicationDrafts_JobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ApplicationDrafts"
    ADD CONSTRAINT "ApplicationDrafts_JobId_fkey" FOREIGN KEY ("JobId") REFERENCES "Jobs"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Applications Applications_ApplicantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Applications"
    ADD CONSTRAINT "Applications_ApplicantId_fkey" FOREIGN KEY ("ApplicantId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Applications Applications_JobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Applications"
    ADD CONSTRAINT "Applications_JobId_fkey" FOREIGN KEY ("JobId") REFERENCES "Jobs"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Bookmarks Bookmarks_CompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Bookmarks"
    ADD CONSTRAINT "Bookmarks_CompanyId_fkey" FOREIGN KEY ("CompanyId") REFERENCES "Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Bookmarks Bookmarks_JobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Bookmarks"
    ADD CONSTRAINT "Bookmarks_JobId_fkey" FOREIGN KEY ("JobId") REFERENCES "Jobs"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Bookmarks Bookmarks_ResourceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Bookmarks"
    ADD CONSTRAINT "Bookmarks_ResourceId_fkey" FOREIGN KEY ("ResourceId") REFERENCES "Resources"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Bookmarks Bookmarks_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Bookmarks"
    ADD CONSTRAINT "Bookmarks_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Cities Cities_CountryCode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Cities"
    ADD CONSTRAINT "Cities_CountryCode_fkey" FOREIGN KEY ("CountryCode") REFERENCES "Countries"(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Companies Companies_CityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Companies"
    ADD CONSTRAINT "Companies_CityId_fkey" FOREIGN KEY ("CityId") REFERENCES "Cities"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Companies Companies_CountryCode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Companies"
    ADD CONSTRAINT "Companies_CountryCode_fkey" FOREIGN KEY ("CountryCode") REFERENCES "Countries"(code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Companies Companies_IndustryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Companies"
    ADD CONSTRAINT "Companies_IndustryId_fkey" FOREIGN KEY ("IndustryId") REFERENCES "Industries"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Companies Companies_PlanId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Companies"
    ADD CONSTRAINT "Companies_PlanId_fkey" FOREIGN KEY ("PlanId") REFERENCES "Plans"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CompanyDrafts CompanyDrafts_CountryCode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CompanyDrafts"
    ADD CONSTRAINT "CompanyDrafts_CountryCode_fkey" FOREIGN KEY ("CountryCode") REFERENCES "Countries"(code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CompanyDrafts CompanyDrafts_CreatorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CompanyDrafts"
    ADD CONSTRAINT "CompanyDrafts_CreatorId_fkey" FOREIGN KEY ("CreatorId") REFERENCES "Users"(id) ON UPDATE CASCADE;


--
-- Name: CompanyDrafts CompanyDrafts_IndustryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CompanyDrafts"
    ADD CONSTRAINT "CompanyDrafts_IndustryId_fkey" FOREIGN KEY ("IndustryId") REFERENCES "Industries"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CompanyDrafts CompanyDrafts_PublishId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CompanyDrafts"
    ADD CONSTRAINT "CompanyDrafts_PublishId_fkey" FOREIGN KEY ("PublishId") REFERENCES "Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Entitlements Entitlements_ApplicationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Entitlements"
    ADD CONSTRAINT "Entitlements_ApplicationId_fkey" FOREIGN KEY ("ApplicationId") REFERENCES "Applications"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Entitlements Entitlements_CompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Entitlements"
    ADD CONSTRAINT "Entitlements_CompanyId_fkey" FOREIGN KEY ("CompanyId") REFERENCES "Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Entitlements Entitlements_JobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Entitlements"
    ADD CONSTRAINT "Entitlements_JobId_fkey" FOREIGN KEY ("JobId") REFERENCES "Jobs"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Events Events_CompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Events"
    ADD CONSTRAINT "Events_CompanyId_fkey" FOREIGN KEY ("CompanyId") REFERENCES "Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Experiences Experiences_DegreeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Experiences"
    ADD CONSTRAINT "Experiences_DegreeId_fkey" FOREIGN KEY ("DegreeId") REFERENCES "Degrees"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Experiences Experiences_SchoolId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Experiences"
    ADD CONSTRAINT "Experiences_SchoolId_fkey" FOREIGN KEY ("SchoolId") REFERENCES "Schools"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Experiences Experiences_StudyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Experiences"
    ADD CONSTRAINT "Experiences_StudyId_fkey" FOREIGN KEY ("StudyId") REFERENCES "Studies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Experiences Experiences_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Experiences"
    ADD CONSTRAINT "Experiences_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Follows Follows_CareerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Follows"
    ADD CONSTRAINT "Follows_CareerId_fkey" FOREIGN KEY ("CareerId") REFERENCES "Careers"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Follows Follows_ProfessionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Follows"
    ADD CONSTRAINT "Follows_ProfessionId_fkey" FOREIGN KEY ("ProfessionId") REFERENCES "Professions"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Follows Follows_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Follows"
    ADD CONSTRAINT "Follows_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GroupEvents GroupEvents_EventId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupEvents"
    ADD CONSTRAINT "GroupEvents_EventId_fkey" FOREIGN KEY ("EventId") REFERENCES "Events"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GroupEvents GroupEvents_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupEvents"
    ADD CONSTRAINT "GroupEvents_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GroupJobs GroupJobs_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupJobs"
    ADD CONSTRAINT "GroupJobs_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GroupJobs GroupJobs_JobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupJobs"
    ADD CONSTRAINT "GroupJobs_JobId_fkey" FOREIGN KEY ("JobId") REFERENCES "Jobs"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GroupMembers GroupMembers_AdminId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupMembers"
    ADD CONSTRAINT "GroupMembers_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GroupMembers GroupMembers_CandidateId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupMembers"
    ADD CONSTRAINT "GroupMembers_CandidateId_fkey" FOREIGN KEY ("CandidateId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GroupMembers GroupMembers_CompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupMembers"
    ADD CONSTRAINT "GroupMembers_CompanyId_fkey" FOREIGN KEY ("CompanyId") REFERENCES "Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GroupMembers GroupMembers_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupMembers"
    ADD CONSTRAINT "GroupMembers_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Identities Identities_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Identities"
    ADD CONSTRAINT "Identities_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Invites Invites_CandidateId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Invites"
    ADD CONSTRAINT "Invites_CandidateId_fkey" FOREIGN KEY ("CandidateId") REFERENCES "Users"(id) ON UPDATE CASCADE;


--
-- Name: Invites Invites_JobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Invites"
    ADD CONSTRAINT "Invites_JobId_fkey" FOREIGN KEY ("JobId") REFERENCES "Jobs"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Invites Invites_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Invites"
    ADD CONSTRAINT "Invites_UserId_fkey" FOREIGN KEY ("SenderId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: JobCategorySkills JobCategorySkills_JobCategoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobCategorySkills"
    ADD CONSTRAINT "JobCategorySkills_JobCategoryId_fkey" FOREIGN KEY ("JobCategoryId") REFERENCES "JobCategories"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobCategorySkills JobCategorySkills_SkillId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobCategorySkills"
    ADD CONSTRAINT "JobCategorySkills_SkillId_fkey" FOREIGN KEY ("SkillId") REFERENCES "Skills"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobDrafts JobDrafts_CareerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobDrafts"
    ADD CONSTRAINT "JobDrafts_CareerId_fkey" FOREIGN KEY ("CareerId") REFERENCES "Careers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: JobDrafts JobDrafts_CityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobDrafts"
    ADD CONSTRAINT "JobDrafts_CityId_fkey" FOREIGN KEY ("CityId") REFERENCES "Cities"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: JobDrafts JobDrafts_CompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobDrafts"
    ADD CONSTRAINT "JobDrafts_CompanyId_fkey" FOREIGN KEY ("CompanyId") REFERENCES "Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: JobDrafts JobDrafts_CountryCode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobDrafts"
    ADD CONSTRAINT "JobDrafts_CountryCode_fkey" FOREIGN KEY ("CountryCode") REFERENCES "Countries"(code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: JobDrafts JobDrafts_CreatorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobDrafts"
    ADD CONSTRAINT "JobDrafts_CreatorId_fkey" FOREIGN KEY ("CreatorId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: JobDrafts JobDrafts_JobCategoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobDrafts"
    ADD CONSTRAINT "JobDrafts_JobCategoryId_fkey" FOREIGN KEY ("JobCategoryId") REFERENCES "JobCategories"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: JobDrafts JobDrafts_ProfessionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobDrafts"
    ADD CONSTRAINT "JobDrafts_ProfessionId_fkey" FOREIGN KEY ("ProfessionId") REFERENCES "Professions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: JobDrafts JobDrafts_PublishId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobDrafts"
    ADD CONSTRAINT "JobDrafts_PublishId_fkey" FOREIGN KEY ("PublishId") REFERENCES "Jobs"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobJobTitleDrafts JobJobTitleDrafts_JobDraftId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobJobTitleDrafts"
    ADD CONSTRAINT "JobJobTitleDrafts_JobDraftId_fkey" FOREIGN KEY ("JobDraftId") REFERENCES "JobDrafts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobJobTitleDrafts JobJobTitleDrafts_JobTitleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobJobTitleDrafts"
    ADD CONSTRAINT "JobJobTitleDrafts_JobTitleId_fkey" FOREIGN KEY ("JobTitleId") REFERENCES "JobTitles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobJobTitles JobJobTitles_JobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobJobTitles"
    ADD CONSTRAINT "JobJobTitles_JobId_fkey" FOREIGN KEY ("JobId") REFERENCES "Jobs"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobJobTitles JobJobTitles_JobTitleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobJobTitles"
    ADD CONSTRAINT "JobJobTitles_JobTitleId_fkey" FOREIGN KEY ("JobTitleId") REFERENCES "JobTitles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobLocationPreferences JobLocationPreferences_CountryCode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobLocationPreferences"
    ADD CONSTRAINT "JobLocationPreferences_CountryCode_fkey" FOREIGN KEY ("CountryCode") REFERENCES "Countries"(code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobLocationPreferences JobLocationPreferences_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobLocationPreferences"
    ADD CONSTRAINT "JobLocationPreferences_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobRolePreferences JobRolePreferences_JobCategoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobRolePreferences"
    ADD CONSTRAINT "JobRolePreferences_JobCategoryId_fkey" FOREIGN KEY ("JobCategoryId") REFERENCES "JobCategories"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobRolePreferences JobRolePreferences_JobTitleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobRolePreferences"
    ADD CONSTRAINT "JobRolePreferences_JobTitleId_fkey" FOREIGN KEY ("JobTitleId") REFERENCES "JobTitles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobRolePreferences JobRolePreferences_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobRolePreferences"
    ADD CONSTRAINT "JobRolePreferences_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobSalaries JobSalaries_JobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSalaries"
    ADD CONSTRAINT "JobSalaries_JobId_fkey" FOREIGN KEY ("JobId") REFERENCES "Jobs"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobSalaryDrafts JobSalaryDrafts_JobDraftId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSalaryDrafts"
    ADD CONSTRAINT "JobSalaryDrafts_JobDraftId_fkey" FOREIGN KEY ("JobDraftId") REFERENCES "JobDrafts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobSkillDrafts JobSkillDrafts_JobDraftId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSkillDrafts"
    ADD CONSTRAINT "JobSkillDrafts_JobDraftId_fkey" FOREIGN KEY ("JobDraftId") REFERENCES "JobDrafts"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobSkillDrafts JobSkillDrafts_SkillId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSkillDrafts"
    ADD CONSTRAINT "JobSkillDrafts_SkillId_fkey" FOREIGN KEY ("SkillId") REFERENCES "Skills"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobSkills JobSkills_JobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSkills"
    ADD CONSTRAINT "JobSkills_JobId_fkey" FOREIGN KEY ("JobId") REFERENCES "Jobs"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobSkills JobSkills_SkillId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobSkills"
    ADD CONSTRAINT "JobSkills_SkillId_fkey" FOREIGN KEY ("SkillId") REFERENCES "Skills"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobTags JobTags_JobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTags"
    ADD CONSTRAINT "JobTags_JobId_fkey" FOREIGN KEY ("JobId") REFERENCES "Jobs"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobTags JobTags_TagId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTags"
    ADD CONSTRAINT "JobTags_TagId_fkey" FOREIGN KEY ("TagId") REFERENCES "Tags"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobTitleSkills JobTitleSkills_JobTitleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTitleSkills"
    ADD CONSTRAINT "JobTitleSkills_JobTitleId_fkey" FOREIGN KEY ("JobTitleId") REFERENCES "JobTitles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobTitleSkills JobTitleSkills_SkillId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTitleSkills"
    ADD CONSTRAINT "JobTitleSkills_SkillId_fkey" FOREIGN KEY ("SkillId") REFERENCES "Skills"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: JobTitles JobTitles_JobCategoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "JobTitles"
    ADD CONSTRAINT "JobTitles_JobCategoryId_fkey" FOREIGN KEY ("JobCategoryId") REFERENCES "JobCategories"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Jobs Jobs_CareerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Jobs"
    ADD CONSTRAINT "Jobs_CareerId_fkey" FOREIGN KEY ("CareerId") REFERENCES "Careers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Jobs Jobs_CityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Jobs"
    ADD CONSTRAINT "Jobs_CityId_fkey" FOREIGN KEY ("CityId") REFERENCES "Cities"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Jobs Jobs_CompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Jobs"
    ADD CONSTRAINT "Jobs_CompanyId_fkey" FOREIGN KEY ("CompanyId") REFERENCES "Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Jobs Jobs_CountryCode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Jobs"
    ADD CONSTRAINT "Jobs_CountryCode_fkey" FOREIGN KEY ("CountryCode") REFERENCES "Countries"(code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Jobs Jobs_CreatorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Jobs"
    ADD CONSTRAINT "Jobs_CreatorId_fkey" FOREIGN KEY ("CreatorId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Jobs Jobs_JobCategoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Jobs"
    ADD CONSTRAINT "Jobs_JobCategoryId_fkey" FOREIGN KEY ("JobCategoryId") REFERENCES "JobCategories"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Jobs Jobs_ProfessionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Jobs"
    ADD CONSTRAINT "Jobs_ProfessionId_fkey" FOREIGN KEY ("ProfessionId") REFERENCES "Professions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Jobs Jobs_ReviewerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Jobs"
    ADD CONSTRAINT "Jobs_ReviewerId_fkey" FOREIGN KEY ("ReviewerId") REFERENCES "Users"(id);


--
-- Name: PendingSkills PendingSkills_EvaluatorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PendingSkills"
    ADD CONSTRAINT "PendingSkills_EvaluatorId_fkey" FOREIGN KEY ("EvaluatorId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PendingSkills PendingSkills_SuggesterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PendingSkills"
    ADD CONSTRAINT "PendingSkills_SuggesterId_fkey" FOREIGN KEY ("SuggesterId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PerkClaims PerkClaims_PerkId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PerkClaims"
    ADD CONSTRAINT "PerkClaims_PerkId_fkey" FOREIGN KEY ("PerkId") REFERENCES "Perks"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PerkClaims PerkClaims_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PerkClaims"
    ADD CONSTRAINT "PerkClaims_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Perks Perks_CompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Perks"
    ADD CONSTRAINT "Perks_CompanyId_fkey" FOREIGN KEY ("CompanyId") REFERENCES "Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Preferences Preferences_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Preferences"
    ADD CONSTRAINT "Preferences_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProfessionSkills ProfessionSkills_ProfessionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfessionSkills"
    ADD CONSTRAINT "ProfessionSkills_ProfessionId_fkey" FOREIGN KEY ("ProfessionId") REFERENCES "Professions"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProfessionSkills ProfessionSkills_SkillId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfessionSkills"
    ADD CONSTRAINT "ProfessionSkills_SkillId_fkey" FOREIGN KEY ("SkillId") REFERENCES "Skills"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Professions Professions_CareerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Professions"
    ADD CONSTRAINT "Professions_CareerId_fkey" FOREIGN KEY ("CareerId") REFERENCES "Careers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ProfileExperiences ProfileExperiences_ExperienceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfileExperiences"
    ADD CONSTRAINT "ProfileExperiences_ExperienceId_fkey" FOREIGN KEY ("ExperienceId") REFERENCES "Experiences"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProfileExperiences ProfileExperiences_ProfileId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfileExperiences"
    ADD CONSTRAINT "ProfileExperiences_ProfileId_fkey" FOREIGN KEY ("ProfileId") REFERENCES "Profiles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProfileSkills ProfileSkills_ProfileId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfileSkills"
    ADD CONSTRAINT "ProfileSkills_ProfileId_fkey" FOREIGN KEY ("ProfileId") REFERENCES "Profiles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProfileSkills ProfileSkills_UserSkillId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProfileSkills"
    ADD CONSTRAINT "ProfileSkills_UserSkillId_fkey" FOREIGN KEY ("UserSkillId") REFERENCES "UserSkills"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Profiles Profiles_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Profiles"
    ADD CONSTRAINT "Profiles_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ResourceSkills ResourceSkills_ResourceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ResourceSkills"
    ADD CONSTRAINT "ResourceSkills_ResourceId_fkey" FOREIGN KEY ("ResourceId") REFERENCES "Resources"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ResourceSkills ResourceSkills_SkillId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ResourceSkills"
    ADD CONSTRAINT "ResourceSkills_SkillId_fkey" FOREIGN KEY ("SkillId") REFERENCES "Skills"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Resources Resources_CareerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Resources"
    ADD CONSTRAINT "Resources_CareerId_fkey" FOREIGN KEY ("CareerId") REFERENCES "Careers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Resources Resources_CreatorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Resources"
    ADD CONSTRAINT "Resources_CreatorId_fkey" FOREIGN KEY ("CreatorId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Resources Resources_Currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Resources"
    ADD CONSTRAINT "Resources_Currency_fkey" FOREIGN KEY ("Currency") REFERENCES "Countries"(code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: SchoolCourses SchoolCourses_DegreeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SchoolCourses"
    ADD CONSTRAINT "SchoolCourses_DegreeId_fkey" FOREIGN KEY ("DegreeId") REFERENCES "Degrees"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SchoolCourses SchoolCourses_SchoolId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SchoolCourses"
    ADD CONSTRAINT "SchoolCourses_SchoolId_fkey" FOREIGN KEY ("SchoolId") REFERENCES "Schools"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Schools Schools_CountryCode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Schools"
    ADD CONSTRAINT "Schools_CountryCode_fkey" FOREIGN KEY ("CountryCode") REFERENCES "Countries"(code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Scores Scores_CompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Scores"
    ADD CONSTRAINT "Scores_CompanyId_fkey" FOREIGN KEY ("CompanyId") REFERENCES "Companies"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Scores Scores_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Scores"
    ADD CONSTRAINT "Scores_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: UserCompanies UserCompanies_CompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserCompanies"
    ADD CONSTRAINT "UserCompanies_CompanyId_fkey" FOREIGN KEY ("CompanyId") REFERENCES "Companies"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserCompanies UserCompanies_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserCompanies"
    ADD CONSTRAINT "UserCompanies_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserSkills UserSkills_SkillId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserSkills"
    ADD CONSTRAINT "UserSkills_SkillId_fkey" FOREIGN KEY ("SkillId") REFERENCES "Skills"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserSkills UserSkills_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserSkills"
    ADD CONSTRAINT "UserSkills_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Users Users_CityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_CityId_fkey" FOREIGN KEY ("CityId") REFERENCES "Cities"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Users Users_CountryCode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_CountryCode_fkey" FOREIGN KEY ("CountryCode") REFERENCES "Countries"(code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Users Users_Nationality_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_Nationality_fkey" FOREIGN KEY ("Nationality") REFERENCES "Countries"(code);


--
-- Name: skill_scores fk_rails_2054a951bc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skill_scores
    ADD CONSTRAINT fk_rails_2054a951bc FOREIGN KEY (user_skill_id) REFERENCES "UserSkills"(id);


--
-- Name: bookmark_scores fk_rails_238e31fd04; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bookmark_scores
    ADD CONSTRAINT fk_rails_238e31fd04 FOREIGN KEY (bookmark_id) REFERENCES "Bookmarks"(id);


--
-- Name: application_scores fk_rails_5c084bac90; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY application_scores
    ADD CONSTRAINT fk_rails_5c084bac90 FOREIGN KEY (application_id) REFERENCES "Applications"(id);


--
-- Name: skill_scores fk_rails_73301aa57e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skill_scores
    ADD CONSTRAINT fk_rails_73301aa57e FOREIGN KEY (job_skill_id) REFERENCES "JobSkills"(id);


--
-- Name: records fk_rails_8c240cab9d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY records
    ADD CONSTRAINT fk_rails_8c240cab9d FOREIGN KEY (job_id) REFERENCES "Jobs"(id);


--
-- Name: skill_scores fk_rails_90bdae91c0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY skill_scores
    ADD CONSTRAINT fk_rails_90bdae91c0 FOREIGN KEY (job_id) REFERENCES "Jobs"(id);


--
-- Name: records fk_rails_9ba3ba9afc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY records
    ADD CONSTRAINT fk_rails_9ba3ba9afc FOREIGN KEY (user_id) REFERENCES "Users"(id);


--
-- Name: application_scores fk_rails_a3c1a8ea64; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY application_scores
    ADD CONSTRAINT fk_rails_a3c1a8ea64 FOREIGN KEY (job_id) REFERENCES "Jobs"(id);


--
-- Name: category_scores fk_rails_aff1bfc5c0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY category_scores
    ADD CONSTRAINT fk_rails_aff1bfc5c0 FOREIGN KEY (job_category_id) REFERENCES "JobCategories"(id);


--
-- Name: bookmark_scores fk_rails_d538df1212; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bookmark_scores
    ADD CONSTRAINT fk_rails_d538df1212 FOREIGN KEY (job_id) REFERENCES "Jobs"(id);


--
-- Name: category_scores fk_rails_db31e11282; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY category_scores
    ADD CONSTRAINT fk_rails_db31e11282 FOREIGN KEY (job_id) REFERENCES "Jobs"(id);


--
-- Name: records fk_rails_ef5adebb8e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY records
    ADD CONSTRAINT fk_rails_ef5adebb8e FOREIGN KEY (jobrec_id) REFERENCES "Jobs"(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20171024033600'),
('20171024044029'),
('20171024044356'),
('20171024094423'),
('20171024125045'),
('20171024234446'),
('20171024235221');


