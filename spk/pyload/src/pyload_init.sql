CREATE TABLE "packages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "name" TEXT NOT NULL, "folder" TEXT, "password" TEXT DEFAULT "", "site" TEXT DEFAULT "", "queue" INTEGER DEFAULT 0 NOT NULL, "packageorder" INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE "links" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "url" TEXT NOT NULL, "name" TEXT, "size" INTEGER DEFAULT 0 NOT NULL, "status" INTEGER DEFAULT 3 NOT NULL, "plugin" TEXT DEFAULT "BasePlugin" NOT NULL, "error" TEXT DEFAULT "", "linkorder" INTEGER DEFAULT 0 NOT NULL, "package" INTEGER DEFAULT 0 NOT NULL, FOREIGN KEY(package) REFERENCES packages(id));
CREATE TABLE "storage" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "identifier" TEXT NOT NULL, "key" TEXT NOT NULL, "value" TEXT DEFAULT "");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "name" TEXT NOT NULL, "email" TEXT DEFAULT "" NOT NULL, "password" TEXT NOT NULL, "role" INTEGER DEFAULT 0 NOT NULL, "permission" INTEGER DEFAULT 0 NOT NULL, "template" TEXT DEFAULT "default" NOT NULL);
CREATE INDEX "pIdIndex" ON links(package);
CREATE VIEW "pstats" AS         SELECT p.id AS id, SUM(l.size) AS sizetotal, COUNT(l.id) AS linkstotal, linksdone, sizedone        FROM packages p JOIN links l ON p.id = l.package LEFT OUTER JOIN        (SELECT p.id AS id, COUNT(*) AS linksdone, SUM(l.size) AS sizedone         FROM packages p JOIN links l ON p.id = l.package AND l.status in (0,4,13) GROUP BY p.id) s ON s.id = p.id         GROUP BY p.id;