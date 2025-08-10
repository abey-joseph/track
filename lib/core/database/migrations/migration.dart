import 'package:sqflite/sqflite.dart';

typedef SqlList = List<String>;

/// Versioned migrations: add v2, v3… later without editing older ones.
final Map<int, SqlList> kMigrations = {
  1: [
    // --- App metadata (optional) ---
    '''
    CREATE TABLE IF NOT EXISTS app_meta (
      key   TEXT PRIMARY KEY,
      value TEXT
    );
    ''',
    "INSERT OR IGNORE INTO app_meta(key, value) VALUES ('db_version', '1');",

    // --- Users ---
    '''
    CREATE TABLE IF NOT EXISTS users (
      user_id    INTEGER PRIMARY KEY AUTOINCREMENT,
      uid        TEXT UNIQUE,
      name       TEXT,
      created_at TEXT DEFAULT (datetime('now'))
    );
    ''',

    // --- Accounts ---
    '''
    CREATE TABLE IF NOT EXISTS accounts (
      account_id  INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id     INTEGER NOT NULL,
      name        TEXT NOT NULL,
      type        TEXT NOT NULL CHECK (type IN ('CASH','BANK','CARD','EWALLET','OTHER')),
      currency    TEXT NOT NULL,
      is_archived INTEGER NOT NULL DEFAULT 0,
      created_at  TEXT DEFAULT (datetime('now')),
      updated_at  TEXT,
      FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
    );
    ''',
    '''CREATE INDEX IF NOT EXISTS idx_accounts_user ON accounts(user_id);''',

    // --- Categories ---
    '''
    CREATE TABLE IF NOT EXISTS categories (
      category_id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id     INTEGER NOT NULL,
      name        TEXT NOT NULL,
      type        TEXT NOT NULL CHECK (type IN ('EXPENSE','INCOME')),
      parent_id   INTEGER,
      icon        TEXT,
      sort_order  INTEGER DEFAULT 0,
      FOREIGN KEY (user_id)   REFERENCES users(user_id) ON DELETE CASCADE,
      FOREIGN KEY (parent_id) REFERENCES categories(category_id) ON DELETE SET NULL,
      UNIQUE(user_id, name, type)
    );
    ''',
    '''CREATE INDEX IF NOT EXISTS idx_categories_parent ON categories(parent_id);''',
    '''CREATE INDEX IF NOT EXISTS idx_categories_user_type ON categories(user_id, type);''',

    // --- Payees ---
    '''
    CREATE TABLE IF NOT EXISTS payees (
      payee_id   INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id    INTEGER NOT NULL,
      name       TEXT NOT NULL,
      normalized TEXT,
      FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
      UNIQUE(user_id, name)
    );
    ''',
    '''CREATE INDEX IF NOT EXISTS idx_payees_user ON payees(user_id);''',

    // --- Transactions ---
    '''
    CREATE TABLE IF NOT EXISTS transactions (
      transaction_id    INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id           INTEGER NOT NULL,
      account_id        INTEGER NOT NULL,
      type              TEXT NOT NULL CHECK (type IN ('EXPENSE','INCOME','TRANSFER')),
      amount            REAL NOT NULL,
      currency          TEXT NOT NULL,
      category_id       INTEGER,
      payee_id          INTEGER,
      note              TEXT,
      occurred_on       TEXT NOT NULL,
      occurred_at       TEXT,
      transfer_group_id TEXT,
      has_split         INTEGER NOT NULL DEFAULT 0,
      created_at        TEXT DEFAULT (datetime('now')),
      updated_at        TEXT,
      FOREIGN KEY (user_id)     REFERENCES users(user_id) ON DELETE CASCADE,
      FOREIGN KEY (account_id)  REFERENCES accounts(account_id) ON DELETE CASCADE,
      FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL,
      FOREIGN KEY (payee_id)    REFERENCES payees(payee_id) ON DELETE SET NULL
    );
    ''',
    '''CREATE INDEX IF NOT EXISTS idx_tx_user_date ON transactions(user_id, occurred_on);''',
    '''CREATE INDEX IF NOT EXISTS idx_tx_account_date ON transactions(account_id, occurred_on);''',
    '''CREATE INDEX IF NOT EXISTS idx_tx_transfer_group ON transactions(transfer_group_id);''',
    '''CREATE INDEX IF NOT EXISTS idx_tx_category ON transactions(category_id);''',
    '''CREATE INDEX IF NOT EXISTS idx_tx_type ON transactions(type);''',
    '''CREATE INDEX IF NOT EXISTS idx_tx_has_split ON transactions(has_split);''',

    // --- Transaction splits ---
    '''
    CREATE TABLE IF NOT EXISTS transaction_splits (
      split_id       INTEGER PRIMARY KEY AUTOINCREMENT,
      transaction_id INTEGER NOT NULL,
      category_id    INTEGER NOT NULL,
      amount         REAL NOT NULL,
      note           TEXT,
      FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id) ON DELETE CASCADE,
      FOREIGN KEY (category_id)    REFERENCES categories(category_id) ON DELETE CASCADE
    );
    ''',
    '''CREATE INDEX IF NOT EXISTS idx_splits_tx ON transaction_splits(transaction_id);''',

    // --- Tags & link table ---
    '''
    CREATE TABLE IF NOT EXISTS tags (
      tag_id   INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id  INTEGER NOT NULL,
      name     TEXT NOT NULL,
      FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
      UNIQUE(user_id, name)
    );
    ''',
    '''
    CREATE TABLE IF NOT EXISTS transaction_tags (
      transaction_id INTEGER NOT NULL,
      tag_id         INTEGER NOT NULL,
      PRIMARY KEY (transaction_id, tag_id),
      FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id) ON DELETE CASCADE,
      FOREIGN KEY (tag_id)         REFERENCES tags(tag_id) ON DELETE CASCADE
    );
    ''',

    // --- Budgets & rules ---
    '''
    CREATE TABLE IF NOT EXISTS budgets (
      budget_id   INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id     INTEGER NOT NULL,
      name        TEXT NOT NULL,
      currency    TEXT NOT NULL,
      period_type TEXT NOT NULL CHECK (period_type IN ('MONTH','WEEK','YEAR','CUSTOM')),
      start_on    TEXT NOT NULL,
      amount      REAL NOT NULL,
      include_transfers INTEGER NOT NULL DEFAULT 0,
      created_at  TEXT DEFAULT (datetime('now')),
      FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
    );
    ''',
    '''
    CREATE TABLE IF NOT EXISTS budget_rules (
      rule_id     INTEGER PRIMARY KEY AUTOINCREMENT,
      budget_id   INTEGER NOT NULL,
      include     INTEGER NOT NULL DEFAULT 1,
      category_id INTEGER,
      account_id  INTEGER,
      tag_id      INTEGER,
      FOREIGN KEY (budget_id)  REFERENCES budgets(budget_id) ON DELETE CASCADE,
      FOREIGN KEY (category_id)REFERENCES categories(category_id) ON DELETE CASCADE,
      FOREIGN KEY (account_id) REFERENCES accounts(account_id) ON DELETE CASCADE,
      FOREIGN KEY (tag_id)     REFERENCES tags(tag_id) ON DELETE CASCADE
    );
    ''',
    '''CREATE INDEX IF NOT EXISTS idx_budget_rules_budget ON budget_rules(budget_id);''',

    // --- Recurring rules ---
    '''
    CREATE TABLE IF NOT EXISTS recurring_rules (
      rule_id       INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id       INTEGER NOT NULL,
      template_json TEXT NOT NULL,
      freq          TEXT NOT NULL CHECK (freq IN ('DAILY','WEEKLY','MONTHLY','YEARLY','CUSTOM')),
      interval      INTEGER NOT NULL DEFAULT 1,
      byweekday     TEXT,
      bymonthday    TEXT,
      next_run_on   TEXT NOT NULL,
      is_paused     INTEGER NOT NULL DEFAULT 0,
      FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
    );
    ''',
    '''CREATE INDEX IF NOT EXISTS idx_recurring_user ON recurring_rules(user_id);''',

    // --- Attachments ---
    '''
    CREATE TABLE IF NOT EXISTS attachments (
      attachment_id  INTEGER PRIMARY KEY AUTOINCREMENT,
      transaction_id INTEGER NOT NULL,
      uri            TEXT NOT NULL,
      mime_type      TEXT,
      note           TEXT,
      FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id) ON DELETE CASCADE
    );
    ''',
    '''CREATE INDEX IF NOT EXISTS idx_attachments_tx ON attachments(transaction_id);''',

    // --- Exchange rates ---
    '''
    CREATE TABLE IF NOT EXISTS exchange_rates (
      rate_date TEXT NOT NULL,
      base      TEXT NOT NULL,
      quote     TEXT NOT NULL,
      rate      REAL NOT NULL,
      PRIMARY KEY (rate_date, base, quote)
    );
    ''',

    // === TRIGGERS ===
    '''
    CREATE TRIGGER IF NOT EXISTS trg_tx_sign_expense BEFORE INSERT ON transactions
    FOR EACH ROW
    WHEN NEW.type = 'EXPENSE' AND NEW.amount > 0
    BEGIN
      SELECT RAISE(ABORT, 'Expense must be negative');
    END;
    ''',
    '''
    CREATE TRIGGER IF NOT EXISTS trg_tx_sign_income BEFORE INSERT ON transactions
    FOR EACH ROW
    WHEN NEW.type = 'INCOME' AND NEW.amount < 0
    BEGIN
      SELECT RAISE(ABORT, 'Income must be positive');
    END;
    ''',
    '''
    CREATE TRIGGER IF NOT EXISTS trg_tx_transfer_no_cat BEFORE INSERT ON transactions
    FOR EACH ROW
    WHEN NEW.type = 'TRANSFER' AND NEW.category_id IS NOT NULL
    BEGIN
      SELECT RAISE(ABORT, 'Transfers cannot have category');
    END;
    ''',
    '''
    CREATE TRIGGER IF NOT EXISTS trg_split_flag_ins
    AFTER INSERT ON transaction_splits
    BEGIN
      UPDATE transactions
      SET has_split = 1
      WHERE transaction_id = NEW.transaction_id;
    END;
    ''',
    '''
    CREATE TRIGGER IF NOT EXISTS trg_split_flag_upd
    AFTER UPDATE ON transaction_splits
    BEGIN
      UPDATE transactions
      SET has_split = CASE
        WHEN EXISTS (SELECT 1 FROM transaction_splits s WHERE s.transaction_id = NEW.transaction_id)
          THEN 1 ELSE 0 END
      WHERE transaction_id = NEW.transaction_id;
    END;
    ''',
    '''
    CREATE TRIGGER IF NOT EXISTS trg_split_flag_del
    AFTER DELETE ON transaction_splits
    BEGIN
      UPDATE transactions
      SET has_split = CASE
        WHEN EXISTS (SELECT 1 FROM transaction_splits s WHERE s.transaction_id = OLD.transaction_id)
          THEN 1 ELSE 0 END
      WHERE transaction_id = OLD.transaction_id;
    END;
    ''',

    // === VIEWS ===
    '''
    CREATE VIEW IF NOT EXISTS v_account_running_balance AS
    SELECT 
      account_id,
      transaction_id,
      occurred_on,
      SUM(amount) OVER (
        PARTITION BY account_id
        ORDER BY occurred_on, transaction_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      ) AS running_balance
    FROM transactions;
    ''',
    '''
    CREATE VIEW IF NOT EXISTS v_daily_type_totals AS
    SELECT occurred_on, type,
           SUM(amount) AS total
    FROM transactions
    WHERE type IN ('EXPENSE','INCOME')
    GROUP BY occurred_on, type;
    ''',
  ],
};

/// Runs migrations stepwise from `from` (exclusive) to `to` (inclusive).
Future<void> runMigrations(Database db, int from, int to) async {
  for (var v = from + 1; v <= to; v++) {
    final steps = kMigrations[v];
    if (steps == null) continue;
    for (final sql in steps) {
      await db.execute(sql);
    }
  }
}
