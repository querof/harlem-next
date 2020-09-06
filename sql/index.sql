
-- Suggested testing environment:
-- http://sqlite.online/

CREATE TABLE searchedPhrases (
  id INTEGER PRIMARY KEY NOT NULL,
  text VARCHAR(200) NOT NULL,
  count INTEGER NOT NULL
);

INSERT INTO searchedPhrases(id, text, count) values(1, 'toaster', 1145);
INSERT INTO searchedPhrases(id, text, count) values(2, 'washing machine', 879);
INSERT INTO searchedPhrases(id, text, count) values(3, 'hairdryer', 476);
INSERT INTO searchedPhrases(id, text, count) values(4, 'samsung tv', 2117);
INSERT INTO searchedPhrases(id, text, count) values(5, 'samsung', 2118);
INSERT INTO searchedPhrases(id, text, count) values(6, 'samsung tablet', 899);
INSERT INTO searchedPhrases(id, text, count) values(7, 'samsung s8', 2117);

CREATE INDEX IF NOT EXISTS idx_text ON searchedPhrases(text COLLATE NOCASE);

SELECT text FROM searchedPhrases WHERE text LIKE 'samsung%' ORDER BY count DESC;

