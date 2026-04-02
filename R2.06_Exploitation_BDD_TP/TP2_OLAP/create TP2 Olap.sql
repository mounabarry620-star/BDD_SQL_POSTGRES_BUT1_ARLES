
CREATE SCHEMA tp2_olap;


SET default_tablespace = '';

--
-- Name: cours; Type: TABLE; Schema: tp2_olap; Owner: carmigna
--

CREATE TABLE tp2_olap.cours (
    idm integer NOT NULL,
    nums integer NOT NULL,
    idi integer NOT NULL,
    nos character varying(5) NOT NULL,
    groupe character(2) NOT NULL,
    dates date,
    phor character(2),
    CONSTRAINT cours_phor_check CHECK ((phor = ANY (ARRAY['AM'::bpchar, 'PM'::bpchar])))
);



--
-- Name: etudiant; Type: TABLE; Schema: tp2_olap; Owner: carmigna
--

CREATE TABLE tp2_olap.etudiant (
    ide integer NOT NULL,
    nom character varying(16) NOT NULL,
    prenom character varying(14),
    groupe character(2) NOT NULL,
    CONSTRAINT etudiant_groupe_check CHECK ((groupe = ANY (ARRAY['G1'::bpchar, 'G2'::bpchar, 'G3'::bpchar])))
);



--
-- Name: evaluation; Type: TABLE; Schema: tp2_olap; Owner: carmigna
--

CREATE TABLE tp2_olap.evaluation (
    idm integer NOT NULL,
    ide integer NOT NULL,
    note double precision
);



--
-- Name: intervenant; Type: TABLE; Schema: tp2_olap; Owner: carmigna
--

CREATE TABLE tp2_olap.intervenant (
    idi integer NOT NULL,
    nom character varying(16) NOT NULL,
    prenom character varying(14),
    statut character(1),
    CONSTRAINT intervenant_statut_check CHECK ((statut = ANY (ARRAY['P'::bpchar, 'V'::bpchar])))
);



--
-- Name: matiere; Type: TABLE; Schema: tp2_olap; Owner: carmigna
--

CREATE TABLE tp2_olap.matiere (
    idm integer NOT NULL,
    intitule character(16) NOT NULL,
    nbs integer NOT NULL
);



--
-- Name: salle; Type: TABLE; Schema: tp2_olap; Owner: carmigna
--

CREATE TABLE tp2_olap.salle (
    nos character varying(5) NOT NULL,
    typs smallint,
    contenance integer,
    CONSTRAINT salle_typs_check CHECK ((typs = ANY (ARRAY[1, 2])))
);



--
-- Data for Name: cours; Type: TABLE DATA; Schema: tp2_olap; Owner: carmigna
--

INSERT INTO tp2_olap.cours VALUES (13, 1, 8, 'E106', 'G1', '2021-09-01', 'PM');
INSERT INTO tp2_olap.cours VALUES (11, 1, 5, 'E107', 'G2', '2021-09-01', 'PM');
INSERT INTO tp2_olap.cours VALUES (11, 1, 2, 'E105', 'G3', '2021-09-01', 'PM');
INSERT INTO tp2_olap.cours VALUES (12, 1, 2, 'E105', 'G1', '2021-09-02', 'AM');
INSERT INTO tp2_olap.cours VALUES (13, 1, 7, 'E103', 'G2', '2021-09-02', 'AM');
INSERT INTO tp2_olap.cours VALUES (12, 1, 1, 'E106', 'G3', '2021-09-02', 'AM');
INSERT INTO tp2_olap.cours VALUES (11, 1, 4, 'E107', 'G1', '2021-09-02', 'PM');
INSERT INTO tp2_olap.cours VALUES (12, 1, 3, 'E105', 'G2', '2021-09-02', 'PM');
INSERT INTO tp2_olap.cours VALUES (12, 2, 2, 'E102', 'G1', '2021-09-05', 'AM');
INSERT INTO tp2_olap.cours VALUES (11, 2, 5, 'E103', 'G2', '2021-09-05', 'AM');
INSERT INTO tp2_olap.cours VALUES (12, 2, 3, 'E102', 'G2', '2021-09-05', 'PM');
INSERT INTO tp2_olap.cours VALUES (11, 2, 2, 'E103', 'G3', '2021-09-05', 'PM');
INSERT INTO tp2_olap.cours VALUES (12, 3, 2, 'E102', 'G2', '2021-09-07', 'AM');
INSERT INTO tp2_olap.cours VALUES (13, 3, 2, 'E102', 'G1', '2021-09-09', 'AM');
INSERT INTO tp2_olap.cours VALUES (13, 1, 2, 'E103', 'G3', '2021-09-15', 'PM');
INSERT INTO tp2_olap.cours VALUES (13, 2, 2, 'E103', 'G3', '2021-09-20', 'PM');
INSERT INTO tp2_olap.cours VALUES (11, 3, 2, 'E103', 'G3', '2021-09-20', 'PM');
INSERT INTO tp2_olap.cours VALUES (13, 3, 6, 'E103', 'G3', '2021-09-02', 'PM');
INSERT INTO tp2_olap.cours VALUES (13, 4, 6, 'E105', 'G3', '2021-09-05', 'AM');
INSERT INTO tp2_olap.cours VALUES (13, 2, 4, 'E105', 'G1', '2021-09-10', 'AM');
INSERT INTO tp2_olap.cours VALUES (13, 4, 7, 'E105', 'G1', '2021-09-10', 'PM');
INSERT INTO tp2_olap.cours VALUES (13, 2, 6, 'E103', 'G2', '2021-09-02', 'PM');
INSERT INTO tp2_olap.cours VALUES (13, 3, 8, 'E104', 'G2', '2021-09-10', 'PM');
INSERT INTO tp2_olap.cours VALUES (13, 4, 2, 'E106', 'G2', '2021-09-10', 'AM');


--
-- Data for Name: etudiant; Type: TABLE DATA; Schema: tp2_olap; Owner: carmigna
--

INSERT INTO tp2_olap.etudiant VALUES (110, 'Elric', 'Alphonse', 'G1');
INSERT INTO tp2_olap.etudiant VALUES (111, 'Yagami', 'Light', 'G1');
INSERT INTO tp2_olap.etudiant VALUES (112, 'White', 'Walter', 'G1');
INSERT INTO tp2_olap.etudiant VALUES (113, 'Grimes', 'Rick', 'G1');
INSERT INTO tp2_olap.etudiant VALUES (114, 'Harkness', 'Jack', 'G2');
INSERT INTO tp2_olap.etudiant VALUES (115, 'Batiatus', 'Quintus', 'G2');
INSERT INTO tp2_olap.etudiant VALUES (116, 'Lebeau', 'Remy', 'G2');
INSERT INTO tp2_olap.etudiant VALUES (117, 'Connor', 'Sarah', 'G2');
INSERT INTO tp2_olap.etudiant VALUES (118, 'Tancarville', 'Laureline', 'G3');
INSERT INTO tp2_olap.etudiant VALUES (119, 'Underwood', 'Francis', 'G3');
INSERT INTO tp2_olap.etudiant VALUES (120, 'Targaryen', 'Aegon', 'G3');
INSERT INTO tp2_olap.etudiant VALUES (121, 'Maximus', 'Magnus', 'G3');


--
-- Data for Name: evaluation; Type: TABLE DATA; Schema: tp2_olap; Owner: carmigna
--

INSERT INTO tp2_olap.evaluation VALUES (11, 110, 12);
INSERT INTO tp2_olap.evaluation VALUES (11, 111, 10);
INSERT INTO tp2_olap.evaluation VALUES (11, 112, 14);
INSERT INTO tp2_olap.evaluation VALUES (11, 113, 15);
INSERT INTO tp2_olap.evaluation VALUES (11, 114, 11);
INSERT INTO tp2_olap.evaluation VALUES (11, 115, 18);
INSERT INTO tp2_olap.evaluation VALUES (11, 116, 17);
INSERT INTO tp2_olap.evaluation VALUES (11, 117, 17);
INSERT INTO tp2_olap.evaluation VALUES (11, 118, 11);
INSERT INTO tp2_olap.evaluation VALUES (11, 119, 9);
INSERT INTO tp2_olap.evaluation VALUES (11, 120, 13);
INSERT INTO tp2_olap.evaluation VALUES (11, 121, 19);
INSERT INTO tp2_olap.evaluation VALUES (12, 110, 14);
INSERT INTO tp2_olap.evaluation VALUES (12, 111, 11);
INSERT INTO tp2_olap.evaluation VALUES (12, 112, 11);
INSERT INTO tp2_olap.evaluation VALUES (12, 113, 16);
INSERT INTO tp2_olap.evaluation VALUES (12, 114, 10);
INSERT INTO tp2_olap.evaluation VALUES (12, 115, 9);
INSERT INTO tp2_olap.evaluation VALUES (12, 116, 15);
INSERT INTO tp2_olap.evaluation VALUES (12, 117, 13);
INSERT INTO tp2_olap.evaluation VALUES (12, 118, 17);
INSERT INTO tp2_olap.evaluation VALUES (12, 119, 11);
INSERT INTO tp2_olap.evaluation VALUES (12, 120, 16);
INSERT INTO tp2_olap.evaluation VALUES (12, 121, 15);
INSERT INTO tp2_olap.evaluation VALUES (13, 110, 12);
INSERT INTO tp2_olap.evaluation VALUES (13, 111, 10);
INSERT INTO tp2_olap.evaluation VALUES (13, 112, 18);
INSERT INTO tp2_olap.evaluation VALUES (13, 113, 13);
INSERT INTO tp2_olap.evaluation VALUES (13, 114, 11);
INSERT INTO tp2_olap.evaluation VALUES (13, 115, 15);
INSERT INTO tp2_olap.evaluation VALUES (13, 116, 16);
INSERT INTO tp2_olap.evaluation VALUES (13, 117, 18);
INSERT INTO tp2_olap.evaluation VALUES (13, 118, 11);
INSERT INTO tp2_olap.evaluation VALUES (13, 119, 8);
INSERT INTO tp2_olap.evaluation VALUES (13, 120, 14);
INSERT INTO tp2_olap.evaluation VALUES (13, 121, 12);


--
-- Data for Name: intervenant; Type: TABLE DATA; Schema: tp2_olap; Owner: carmigna
--

INSERT INTO tp2_olap.intervenant VALUES (1, 'Codd', 'Ted', 'V');
INSERT INTO tp2_olap.intervenant VALUES (2, 'Mirandol', 'Serge', 'P');
INSERT INTO tp2_olap.intervenant VALUES (3, 'Laka', 'Lotfi', 'P');
INSERT INTO tp2_olap.intervenant VALUES (4, 'Chettiti', 'Rosine', 'V');
INSERT INTO tp2_olap.intervenant VALUES (5, 'Restenst', 'Christian', 'V');
INSERT INTO tp2_olap.intervenant VALUES (6, 'Carmigniac', 'Laurent', 'P');
INSERT INTO tp2_olap.intervenant VALUES (7, 'Chauve', 'Nicolas', 'V');
INSERT INTO tp2_olap.intervenant VALUES (8, 'Martin', 'Michel', 'V');


--
-- Data for Name: matiere; Type: TABLE DATA; Schema: tp2_olap; Owner: carmigna
--

INSERT INTO tp2_olap.matiere VALUES (11, 'BD1             ', 3);
INSERT INTO tp2_olap.matiere VALUES (12, 'C++             ', 3);
INSERT INTO tp2_olap.matiere VALUES (13, 'PHP             ', 4);


--
-- Data for Name: salle; Type: TABLE DATA; Schema: tp2_olap; Owner: carmigna
--

INSERT INTO tp2_olap.salle VALUES ('E102', 1, 29);
INSERT INTO tp2_olap.salle VALUES ('E103', 1, 29);
INSERT INTO tp2_olap.salle VALUES ('E104', 1, 18);
INSERT INTO tp2_olap.salle VALUES ('E105', 1, 29);
INSERT INTO tp2_olap.salle VALUES ('E106', 1, 30);
INSERT INTO tp2_olap.salle VALUES ('E107', 1, 30);
INSERT INTO tp2_olap.salle VALUES ('E001', 2, 48);


--
-- Name: cours cours_pkey; Type: CONSTRAINT; Schema: tp2_olap; Owner: carmigna
--

ALTER TABLE ONLY tp2_olap.cours
    ADD CONSTRAINT cours_pkey PRIMARY KEY (idm, nums, idi);


--
-- Name: etudiant etudiant_pkey; Type: CONSTRAINT; Schema: tp2_olap; Owner: carmigna
--

ALTER TABLE ONLY tp2_olap.etudiant
    ADD CONSTRAINT etudiant_pkey PRIMARY KEY (ide);


--
-- Name: evaluation evaluation_pkey; Type: CONSTRAINT; Schema: tp2_olap; Owner: carmigna
--

ALTER TABLE ONLY tp2_olap.evaluation
    ADD CONSTRAINT evaluation_pkey PRIMARY KEY (idm, ide);


--
-- Name: intervenant intervenant_pkey; Type: CONSTRAINT; Schema: tp2_olap; Owner: carmigna
--

ALTER TABLE ONLY tp2_olap.intervenant
    ADD CONSTRAINT intervenant_pkey PRIMARY KEY (idi);


--
-- Name: matiere matiere_pkey; Type: CONSTRAINT; Schema: tp2_olap; Owner: carmigna
--

ALTER TABLE ONLY tp2_olap.matiere
    ADD CONSTRAINT matiere_pkey PRIMARY KEY (idm);


--
-- Name: salle salle_pkey; Type: CONSTRAINT; Schema: tp2_olap; Owner: carmigna
--

ALTER TABLE ONLY tp2_olap.salle
    ADD CONSTRAINT salle_pkey PRIMARY KEY (nos);


--
-- Name: cours cours_idi_fkey; Type: FK CONSTRAINT; Schema: tp2_olap; Owner: carmigna
--

ALTER TABLE ONLY tp2_olap.cours
    ADD CONSTRAINT cours_idi_fkey FOREIGN KEY (idi) REFERENCES tp2_olap.intervenant(idi);


--
-- Name: cours cours_idm_fkey; Type: FK CONSTRAINT; Schema: tp2_olap; Owner: carmigna
--

ALTER TABLE ONLY tp2_olap.cours
    ADD CONSTRAINT cours_idm_fkey FOREIGN KEY (idm) REFERENCES tp2_olap.matiere(idm);


--
-- Name: cours cours_nos_fkey; Type: FK CONSTRAINT; Schema: tp2_olap; Owner: carmigna
--

ALTER TABLE ONLY tp2_olap.cours
    ADD CONSTRAINT cours_nos_fkey FOREIGN KEY (nos) REFERENCES tp2_olap.salle(nos);


--
-- Name: evaluation evaluation_ide_fkey; Type: FK CONSTRAINT; Schema: tp2_olap; Owner: carmigna
--

ALTER TABLE ONLY tp2_olap.evaluation
    ADD CONSTRAINT evaluation_ide_fkey FOREIGN KEY (ide) REFERENCES tp2_olap.etudiant(ide);


--
-- Name: evaluation evaluation_idm_fkey; Type: FK CONSTRAINT; Schema: tp2_olap; Owner: carmigna
--

ALTER TABLE ONLY tp2_olap.evaluation
    ADD CONSTRAINT evaluation_idm_fkey FOREIGN KEY (idm) REFERENCES tp2_olap.matiere(idm);


--
-- PostgreSQL database dump complete
--

