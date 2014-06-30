-- object: public.users | type: TABLE --
-- DROP TABLE public.users;
CREATE TABLE public.users(
    id serial NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    secret text NOT NULL,
    CONSTRAINT "PRIMARY" PRIMARY KEY (id),
    CONSTRAINT email_unique UNIQUE (email),
    CONSTRAINT username_unique UNIQUE (username)

);
-- ddl-end --
-- object: public.complaints | type: TABLE --
-- DROP TABLE public.complaints;
CREATE TABLE public.complaints(
    complaintid serial NOT NULL,
    id_users integer NOT NULL,
    complaint text NOT NULL,
    created_date timestamp NOT NULL DEFAULT LOCALTIMESTAMP,
    CONSTRAINT complaint_id_primary PRIMARY KEY (complaintid)

);
-- ddl-end --
-- object: users_fk | type: CONSTRAINT --
-- ALTER TABLE public.complaints DROP CONSTRAINT users_fk;
ALTER TABLE public.complaints ADD CONSTRAINT users_fk FOREIGN KEY (id_users)
REFERENCES public.users (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: public.comments | type: TABLE --
-- DROP TABLE public.comments;
CREATE TABLE public.comments(
    commentid smallint NOT NULL,
    complaintid_complaints integer NOT NULL,
    id_users integer NOT NULL,
    created_date timestamp NOT NULL DEFAULT LOCALTIMESTAMP,
    comment smallint NOT NULL
);
-- ddl-end --
-- object: complaints_fk | type: CONSTRAINT --
-- ALTER TABLE public.comments DROP CONSTRAINT complaints_fk;
ALTER TABLE public.comments ADD CONSTRAINT complaints_fk FOREIGN KEY (complaintid_complaints)
REFERENCES public.complaints (complaintid) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: users_fk | type: CONSTRAINT --
-- ALTER TABLE public.comments DROP CONSTRAINT users_fk;
ALTER TABLE public.comments ADD CONSTRAINT users_fk FOREIGN KEY (id_users)
REFERENCES public.users (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --
