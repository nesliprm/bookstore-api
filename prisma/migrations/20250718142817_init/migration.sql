/*
  Warnings:

  - The primary key for the `Book` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- CreateTable
CREATE TABLE "Record" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "artist" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "available" BOOLEAN NOT NULL,
    "genre" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Order" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "order_type" TEXT NOT NULL,
    "book_id" TEXT,
    "record_id" TEXT,
    "user_id" TEXT NOT NULL,
    "order_date" DATETIME NOT NULL,
    "delivery_date" DATETIME,
    "payment_method" TEXT NOT NULL,
    "comment" TEXT,
    CONSTRAINT "Order_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Order_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "Book" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Order_record_id_fkey" FOREIGN KEY ("record_id") REFERENCES "Record" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Book" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "isbn" TEXT NOT NULL,
    "pages" INTEGER NOT NULL,
    "available" BOOLEAN NOT NULL,
    "genre" TEXT NOT NULL
);
INSERT INTO "new_Book" ("author", "available", "genre", "id", "isbn", "pages", "title") SELECT "author", "available", "genre", "id", "isbn", "pages", "title" FROM "Book";
DROP TABLE "Book";
ALTER TABLE "new_Book" RENAME TO "Book";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE INDEX "Order_book_id_idx" ON "Order"("book_id");

-- CreateIndex
CREATE INDEX "Order_record_id_idx" ON "Order"("record_id");

-- CreateIndex
CREATE INDEX "Order_user_id_idx" ON "Order"("user_id");
