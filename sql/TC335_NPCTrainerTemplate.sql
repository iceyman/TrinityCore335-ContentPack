-- =============================================================================
--  NPC Profession Trainer Template (Grandmaster Alchemy)
--  TrinityCore 3.3.5  (TDB 25101 world schema)
--
--  Original content by StygianTheBest (AzerothCore-Content project).
--  Ported and adapted to the live TrinityCore 3.3.5 schema by Iceymidgit.
--
--  TrinityCore overhauled trainers: the old creature_template trainer_* columns
--  were removed. Trainers now live in three tables: `trainer` (the list header),
--  `trainer_spell` (what it teaches), and `creature_default_trainer` (which NPC
--  uses which list). This template spawns a working Grandmaster Alchemy trainer
--  by attaching the NPC to the game's existing Alchemy list (TrainerId 75, the
--  same list Linzy Blackbolt uses). See the scaffold at the bottom to build your
--  own custom list instead.
-- =============================================================================
USE world;

SET
@Entry      := 60500,
@Model      := 18239,          -- Epic Mage model
@Name       := "Alchemy",
@Title      := "Grandmaster Trainer",
@Icon       := "Trainer",
@NPCFlag    := 81,             -- Gossip(1) + Trainer(16) + Profession Trainer(64)
@Faction    := 35,
@Scale      := 0.25,
@AlchemyTrainerId := 75;       -- existing in-game Alchemy grandmaster list

-- ---- The NPC (TC-valid columns; trainer_* and InhabitType removed, AiName->AIName) ----
DELETE FROM `creature_template` WHERE `entry`=@Entry;
INSERT INTO `creature_template`
 (`entry`,`modelid1`,`name`,`subname`,`IconName`,`minlevel`,`maxlevel`,`faction`,`npcflag`,
  `speed_walk`,`speed_run`,`scale`,`rank`,`unit_class`,`unit_flags`,`unit_flags2`,`type`,
  `RegenHealth`,`flags_extra`,`AIName`)
VALUES
 (@Entry,@Model,@Name,@Title,@Icon,80,80,@Faction,@NPCFlag,
  1,1.14286,@Scale,1,1,4608,2048,7,
  1,2,'');

-- ---- Equip a Dynamite Stick (cosmetic), TC creature_equip_template layout ----
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template`
 (`CreatureID`,`ID`,`ItemID1`,`ItemID2`,`ItemID3`,`VerifiedBuild`)
 VALUES (@Entry,1,2884,0,0,12340);

-- ---- Make it teach: link the NPC to the existing Alchemy trainer list ----
DELETE FROM `creature_default_trainer` WHERE `CreatureId`=@Entry;
INSERT INTO `creature_default_trainer` (`CreatureId`,`TrainerId`) VALUES (@Entry,@AlchemyTrainerId);

-- Spawn it in-game with:  .npc add 60500

-- =============================================================================
--  OPTIONAL: build your OWN custom trainer list instead of borrowing list 75.
--  Pick a free TrainerId (e.g. 605000), then:
--
--   DELETE FROM `trainer` WHERE `Id`=605000;
--   INSERT INTO `trainer` (`Id`,`Type`,`Requirement`,`Greeting`)
--     VALUES (605000, 2, 0, 'What would you like to learn?');  -- Type 2 = tradeskill
--
--   DELETE FROM `trainer_spell` WHERE `TrainerId`=605000;
--   INSERT INTO `trainer_spell`
--     (`TrainerId`,`SpellId`,`MoneyCost`,`ReqSkillLine`,`ReqSkillRank`,`ReqLevel`)
--     VALUES
--       (605000, <teaching_spell_id>, <copper_cost>, 171, 0, 0);  -- 171 = Alchemy skill
--       -- add one row per spell you want taught
--
--   DELETE FROM `creature_default_trainer` WHERE `CreatureId`=60500;
--   INSERT INTO `creature_default_trainer` (`CreatureId`,`TrainerId`) VALUES (60500,605000);
-- =============================================================================
