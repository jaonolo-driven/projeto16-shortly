CREATE TABLE "users" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE "sessions" (
	"id" SERIAL PRIMARY KEY,
	"authToken" VARCHAR(36) NOT NULL UNIQUE,
	"createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
	"endedAt" TIMESTAMP,
	"userId" INTEGER NOT NULL REFERENCES "users"("id")
);

CREATE TABLE "urls" (
	"id" SERIAL PRIMARY KEY,
	"shortUrl" VARCHAR(21) NOT NULL UNIQUE,
	"viewCount" BIGINT NOT NULL DEFAULT 0,
	"createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
	"deletedAt" TIMESTAMP,
	"userId" INTEGER NOT NULL REFERENCES "users"("id")
);