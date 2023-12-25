SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `provider_account_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `expires_at` int(11) NULL DEFAULT NULL,
  `token_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `session_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `accounts_provider_provider_account_id_key`(`provider`, `provider_account_id`) USING BTREE,
  INDEX `accounts_user_id_fkey`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blobs
-- ----------------------------
DROP TABLE IF EXISTS `blobs`;
CREATE TABLE `blobs`  (
  `id` bigint(20) NOT NULL,
  `hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `workspace_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `blob` blob NOT NULL,
  `length` bigint(20) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blobs_workspace_id_hash_key`(`workspace_id`, `hash`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_migrations
-- ----------------------------
DROP TABLE IF EXISTS `data_migrations`;
CREATE TABLE `data_migrations`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `started_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `finished_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for features
-- ----------------------------
DROP TABLE IF EXISTS `features`;
CREATE TABLE `features`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `feature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `version` int(20) NOT NULL DEFAULT 0,
  `type` int(20) NOT NULL,
  `configs` json NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `features_feature_version_key`(`feature`, `version`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for new_features_waiting_list
-- ----------------------------
DROP TABLE IF EXISTS `new_features_waiting_list`;
CREATE TABLE `new_features_waiting_list`  (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` smallint(6) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `new_features_waiting_list_email_key`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for optimized_blobs
-- ----------------------------
DROP TABLE IF EXISTS `optimized_blobs`;
CREATE TABLE `optimized_blobs`  (
  `id` bigint(20) NOT NULL,
  `hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `workspace_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `blob` blob NOT NULL,
  `length` bigint(20) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `optimized_blobs_workspace_id_hash_params_key`(`workspace_id`, `hash`, `params`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` bigint(20) NOT NULL,
  `session_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `expires` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sessions_session_token_key`(`session_token`) USING BTREE,
  INDEX `sessions_user_id_fkey`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for snapshot_histories
-- ----------------------------
DROP TABLE IF EXISTS `snapshot_histories`;
CREATE TABLE `snapshot_histories`  (
  `workspace_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `guid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `blob` blob NOT NULL,
  `state` blob NULL,
  `expired_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`workspace_id`, `guid`, `timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for snapshots
-- ----------------------------
DROP TABLE IF EXISTS `snapshots`;
CREATE TABLE `snapshots`  (
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `workspace_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `blob` blob NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `seq` int(11) NOT NULL DEFAULT 0,
  `state` blob NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`guid`, `workspace_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for updates
-- ----------------------------
DROP TABLE IF EXISTS `updates`;
CREATE TABLE `updates`  (
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `workspace_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `blob` blob NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `seq` int(11) NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`workspace_id`, `guid`, `seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_features
-- ----------------------------
DROP TABLE IF EXISTS `user_features`;
CREATE TABLE `user_features`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(36) NOT NULL,
  `feature_id` int(20) NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `expired_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_features_user_id_fkey`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_invoices
-- ----------------------------
DROP TABLE IF EXISTS `user_invoices`;
CREATE TABLE `user_invoices`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(36) NOT NULL,
  `stripe_invoice_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `plan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `recurring` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_payment_error` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `user_invoices_stripe_invoice_id_key`(`stripe_invoice_id`) USING BTREE,
  INDEX `user_invoices_user_id_fkey`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_stripe_customers
-- ----------------------------
DROP TABLE IF EXISTS `user_stripe_customers`;
CREATE TABLE `user_stripe_customers`  (
  `user_id` bigint(255) NOT NULL,
  `stripe_customer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_stripe_customers_stripe_customer_id_key`(`stripe_customer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `user_subscriptions`;
CREATE TABLE `user_subscriptions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(36) NOT NULL,
  `plan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `recurring` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stripe_subscription_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `start` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `end` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `next_bill_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `canceled_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `trial_start` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `trial_end` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `stripe_schedule_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `user_subscriptions_user_id_key`(`user_id`) USING BTREE,
  UNIQUE INDEX `user_subscriptions_stripe_subscription_id_key`(`stripe_subscription_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_workspace_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_workspace_permissions`;
CREATE TABLE `user_workspace_permissions`  (
  `id` bigint(20) NOT NULL,
  `workspace_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `entity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `accepted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `sub_page_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_workspace_permissions_workspace_id_sub_page_id_entity__key`(`workspace_id`, `sub_page_id`, `entity_id`) USING BTREE,
  INDEX `user_workspace_permissions_entity_id_fkey`(`entity_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `email_verified` timestamp(0) NULL DEFAULT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_key`(`email`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for verification_tokens
-- ----------------------------
DROP TABLE IF EXISTS `verification_tokens`;
CREATE TABLE `verification_tokens`  (
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `id` bigint(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `verificationtokens_token_key`(`token`) USING BTREE,
  UNIQUE INDEX `verificationtokens_identifier_token_key`(`identifier`, `token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for workspace_page_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `workspace_page_user_permissions`;
CREATE TABLE `workspace_page_user_permissions`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `workspace_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `page_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` smallint(6) NOT NULL,
  `accepted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `workspace_page_user_permissions_workspace_id_page_id_user_i_key`(`workspace_id`, `page_id`, `user_id`) USING BTREE,
  INDEX `workspace_page_user_permissions_user_id_fkey`(`user_id`) USING BTREE,
  CONSTRAINT `workspace_page_user_permissions_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `workspace_page_user_permissions_workspace_id_fkey` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for workspace_pages
-- ----------------------------
DROP TABLE IF EXISTS `workspace_pages`;
CREATE TABLE `workspace_pages`  (
  `workspace_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `page_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `mode` smallint(6) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `id` bigint(255) NOT NULL,
  PRIMARY KEY (`workspace_id`, `page_id`) USING BTREE,
  CONSTRAINT `workspace_pages_workspace_id_fkey` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for workspace_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `workspace_user_permissions`;
CREATE TABLE `workspace_user_permissions`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `workspace_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` bigint(36) NOT NULL,
  `type` smallint(6) NOT NULL,
  `accepted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `workspace_user_permissions_workspace_id_user_id_key`(`workspace_id`, `user_id`) USING BTREE,
  INDEX `workspace_user_permissions_user_id_fkey`(`user_id`) USING BTREE,
  CONSTRAINT `workspace_user_permissions_workspace_id_fkey` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for workspaces
-- ----------------------------
DROP TABLE IF EXISTS `workspaces`;
CREATE TABLE `workspaces`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
