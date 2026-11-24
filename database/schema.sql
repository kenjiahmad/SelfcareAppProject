BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "account" (
	"account_id"	INTEGER,
	"name"	TEXT,
	"birth_date"	TEXT,
	"role"	TEXT,
	"email"	TEXT,
	"password"	TEXT,
	"created_at"	TEXT DEFAULT (datetime('now')),
	"is_deleted"	INTEGER DEFAULT 0,
	"deleted_at"	TEXT,
	"specialist"	text,
	"bio"	text,
	PRIMARY KEY("account_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "activity_log" (
	"log_id"	INTEGER,
	"account_id"	INTEGER NOT NULL,
	"activity"	TEXT NOT NULL,
	"created_at"	text,
	PRIMARY KEY("log_id" AUTOINCREMENT),
	FOREIGN KEY("account_id") REFERENCES "account"("account_id")
);
CREATE TABLE IF NOT EXISTS "chat_message" (
	"chat_id"	INTEGER,
	"assignment_id"	INTEGER,
	"sender_id"	INTEGER,
	"message_text"	TEXT,
	"sent_at"	TEXT,
	"is_read"	INTEGER DEFAULT 0,
	PRIMARY KEY("chat_id" AUTOINCREMENT),
	FOREIGN KEY("assignment_id") REFERENCES "counselor_assignment"("assignment_id")
);
CREATE TABLE IF NOT EXISTS "counselor_assignment" (
	"assignment_id"	INTEGER,
	"user_id"	INTEGER,
	"counselor_id"	INTEGER,
	"status"	TEXT DEFAULT 'PENDING',
	"is_active"	INTEGER DEFAULT 1,
	"created_at"	TEXT,
	PRIMARY KEY("assignment_id" AUTOINCREMENT),
	FOREIGN KEY("counselor_id") REFERENCES "account"("account_id"),
	FOREIGN KEY("user_id") REFERENCES "account"("account_id")
);
CREATE TABLE IF NOT EXISTS "finance_tracker" (
	"finance_id"	INTEGER,
	"account_id"	INTEGER NOT NULL,
	"type"	TEXT NOT NULL CHECK("type" IN ('income', 'expense')),
	"description"	TEXT,
	"amount"	REAL NOT NULL,
	"is_active"	INTEGER DEFAULT 1,
	"created_at"	TEXT DEFAULT (datetime('now')),
	PRIMARY KEY("finance_id" AUTOINCREMENT),
	FOREIGN KEY("account_id") REFERENCES "account"("account_id")
);
CREATE TABLE IF NOT EXISTS "journal" (
	"journal_id"	INTEGER NOT NULL,
	"account_id"	INTEGER NOT NULL,
	"title"	TEXT NOT NULL,
	"content"	TEXT NOT NULL,
	"is_deleted"	INTEGER DEFAULT 0,
	"is_active"	INTEGER DEFAULT 1,
	"created_at"	TEXT DEFAULT (datetime('now')),
	PRIMARY KEY("journal_id" AUTOINCREMENT),
	FOREIGN KEY("account_id") REFERENCES "account"("account_id")
);
CREATE TABLE IF NOT EXISTS "mood_tracker" (
	"mood_id"	INTEGER,
	"account_id"	INTEGER NOT NULL,
	"mood"	TEXT NOT NULL,
	"note"	TEXT,
	"is_active"	INTEGER DEFAULT 1,
	"created_at"	TEXT DEFAULT (datetime('now')),
	PRIMARY KEY("mood_id" AUTOINCREMENT),
	FOREIGN KEY("account_id") REFERENCES "account"("account_id")
);
CREATE TABLE IF NOT EXISTS "todo_list" (
	"todo_id"	INTEGER,
	"account_id"	INTEGER NOT NULL,
	"title"	TEXT NOT NULL,
	"description"	TEXT,
	"due_date"	TEXT,
	"is_done"	INTEGER DEFAULT 0,
	"is_deleted"	INTEGER DEFAULT 0,
	"is_active"	INTEGER DEFAULT 1,
	"created_at"	TEXT DEFAULT (datetime('now')),
	PRIMARY KEY("todo_id" AUTOINCREMENT),
	FOREIGN KEY("account_id") REFERENCES "account"("account_id")
);
COMMIT;
