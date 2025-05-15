-- USERS --------------------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
    id               INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    login_id         VARCHAR(20)  NOT NULL UNIQUE,
    login_password   VARCHAR(255) NOT NULL,         
    nickname         VARCHAR(50)  NOT NULL,
    profile_image    VARCHAR(255),
    status_message   VARCHAR(200),
    is_deleted       TINYINT(1) DEFAULT 0,
    signup_at        TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CHANNELS -----------------------------------------------------------
CREATE TABLE IF NOT EXISTS channels (
    id               INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(50)  NOT NULL UNIQUE,
    link             VARCHAR(255) NOT NULL,
    max_users        INT UNSIGNED,
    is_deleted       TINYINT(1) DEFAULT 0,
    created_at       TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    owner_id         INT UNSIGNED NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CHATS --------------------------------------------------------------
CREATE TABLE IF NOT EXISTS chats (
    id               INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    channel_id       INT UNSIGNED NOT NULL,
    user_id          INT UNSIGNED NOT NULL,
    message          TEXT         NOT NULL,
    created_at       TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (channel_id) REFERENCES channels(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id)    REFERENCES users(id)    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- FOLLOWS ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS follows (
    id               INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    follower_id      INT UNSIGNED NOT NULL,
    followee_id      INT UNSIGNED NOT NULL,
    followed_at      TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (follower_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (followee_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- BLOCKS -------------------------------------------------------------
CREATE TABLE IF NOT EXISTS blocks (
    id               INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    blocker_id       INT UNSIGNED NOT NULL,
    blocked_id       INT UNSIGNED NOT NULL,
    blocked_at       TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (blocker_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (blocked_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
