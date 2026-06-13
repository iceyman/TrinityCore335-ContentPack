-- =============================================================================
--  New Character Starter Kit — C++ module companion (SUPERSEDED)
--  TrinityCore 3.3.5  (TDB 25101 world schema)
--
--  Created by Iceymidgit.
--
--  Older once-per-ACCOUNT approach: SQL data for the StarterKit C++ PlayerScript. Superseded by the quest-based files above (no recompile needed). Kept for reference.
-- =============================================================================

-- #############################################################################
--  NEW CHARACTER STARTER KIT  -  TrinityCore 3.3.5
--  Companion data for the StarterKit C++ module (starter_kit.cpp).
--
--  HOW THE ANTI-ABUSE WORKS:
--   - The module grants the kit ONCE PER ACCOUNT, recorded in `starter_kit_log`.
--   - Deleting and recreating characters does NOT re-grant (the account is
--     already logged), so there is no gold/gear farm loop.
--   - Gear below is HEIRLOOMS: account-bound, usable from level 1, and
--     impossible to sell for gold or trade -> zero resale value by design.
--   - The module also soulbinds everything it grants (bags included).
--
--  EDIT FREELY: change rows in `starter_kit_items` to set exactly what each
--  class receives. class = 0 means "all classes". No recompile needed to
--  change the loadout -- only to change the module logic itself.
-- #############################################################################

-- Tracking table (lives in the CHARACTERS database) -------------------------
CREATE TABLE IF NOT EXISTS `starter_kit_log` (
  `account`        INT UNSIGNED NOT NULL,
  `character_guid` INT UNSIGNED NOT NULL,
  `grant_time`     INT UNSIGNED NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COMMENT='Accounts that have already received the new-character starter kit';

-- Loadout table (lives in the WORLD database) -------------------------------
CREATE TABLE IF NOT EXISTS `starter_kit_items` (
  `class` TINYINT UNSIGNED NOT NULL COMMENT '0 = all classes; otherwise WoW class id',
  `item`  INT UNSIGNED NOT NULL,
  `count` INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`class`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COMMENT='Items granted to new characters by class (0 = everyone)';

DELETE FROM `starter_kit_items`;
INSERT INTO `starter_kit_items` (`class`,`item`,`count`) VALUES
-- ===== Everyone: four 16-slot bags =====
(0, 21841, 4),    -- Netherweave Bag (16 slots) x4
-- ===== Class-appropriate heirloom weapon (account-bound, lvl 1 usable) =====
(1, 42943, 1),    -- Warrior  : Bloodied Arcanite Reaper (2H axe)
(2, 42948, 1),    -- Paladin  : Devout Aurastone Hammer (1H mace)
(3, 42946, 1),    -- Hunter   : Charmed Ancient Bone Bow
(4, 42944, 1),    -- Rogue    : Balanced Heartseeker (dagger)
(5, 42947, 1),    -- Priest   : Dignified Headmaster's Charge (staff)
(6, 42943, 1),    -- DK       : Bloodied Arcanite Reaper (2H axe)
(7, 42948, 1),    -- Shaman   : Devout Aurastone Hammer (1H mace)
(8, 42947, 1),    -- Mage     : Dignified Headmaster's Charge (staff)
(9, 42947, 1),    -- Warlock  : Dignified Headmaster's Charge (staff)
(11,42947, 1),    -- Druid    : Dignified Headmaster's Charge (staff)
-- ===== Optional: add heirloom armor per class below, e.g. shoulders/chest =====
-- (1, 42949, 1), -- Polished Spaulders of Valor (plate shoulders)  ... etc.
(0, 0, 0);        -- (ignored placeholder so trailing comma edits are easy)
DELETE FROM `starter_kit_items` WHERE `item`=0;
