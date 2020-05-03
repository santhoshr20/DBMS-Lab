REM 10)It is necessary to represent the gender of an artist in the table.

desc Artist;

ALTER TABLE Artist ADD Gender char(1);

desc Artist;
 

REM 11)The first few words of the lyrics constitute the song name. The song name do not accommodate some of the words (in lyrics).

desc Song;

ALTER TABLE Song MODIFY s_name varchar2(50);

desc Song;


REM 12)The phone number of each studio should be different.

desc Studio;

ALTER TABLE Studio ADD CONSTRAINT phone_un UNIQUE(phone);

desc Studio;


REM 13)An artist who sings a song for a particular track of an album can not be recorded without the record_date.

desc SungBy;

ALTER TABLE SungBy MODIFY rec_date NOT NULL;

desc SungBy;

REM 14)It was decided to include the genre NAT for nature songs.

ALTER TABLE Song DROP CONSTRAINT song_ch;

ALTER TABLE Song ADD CONSTRAINT song_ch CHECK(genre IN('PHI','REL','LOV','DEV','PAT','NAT'));

REM 15)Due to typoerror,there may be a possibility of false information. Hence while deleting the song information, make sure that all the corresponding information are also deleted

ALTER TABLE Album DROP CONSTRAINT s_name_fk;
ALTER TABLE Album DROP CONSTRAINT a_id_fk;
ALTER TABLE Song Drop CONSTRAINT s_fk;
ALTER TABLE SungBy DROP CONSTRAINT sb_id_fk;
ALTER TABLE SungBy DROP CONSTRAINT sb_ar_id_fk;


ALTER TABLE Album ADD CONSTRAINT s_name_fk FOREIGN KEY(s_name) REFERENCES Studio(s_name) ON DELETE CASCADE;
ALTER TABLE Album ADD CONSTRAINT a_id_fk FOREIGN  KEY(m_id) REFERENCES Musician(m_id) ON DELETE CASCADE;
ALTER TABLE Song ADD CONSTRAINT s_fk FOREIGN KEY(a_id) REFERENCES Album(a_id);
ALTER TABLE SungBy ADD CONSTRAINT sb_id_fk FOREIGN KEY(a_id,track_no) REFERENCES Song(a_id,track_no) ON DELETE CASCADE;
ALTER TABLE SungBy ADD CONSTRAINT sb_ar_id_fk FOREIGN KEY(ar_id) REFERENCES Artist(ar_id) ON DELETE CASCADE;


REM checking the alterations
REM 10
desc Artist;

REM 11
desc Song

REM 12 violating unique constarint
INSERT INTO Studio VALUES(
	'r1',
	'Pondy',
	'1234'	
);

REM 13
desc SungBy;

REM 14
INSERT INTO Song VALUES(
	1,
	6,
	'Loose You To Love Me',
	9,
	'NAT');
SELECT * FROM Song;

REM 15
DELETE FROM Song Where a_id = 1;
DELETE FROM Album Where a_id = 1;
SELECT * FROM Song;
SELECT * FROM SungBy;