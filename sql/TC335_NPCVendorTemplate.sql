-- =============================================================================
--  Firework Vendor (NPC Vendor Template)
--  TrinityCore 3.3.5  (TDB 25101 world schema)
--
--  Original content by StygianTheBest (AzerothCore-Content project).
--  Ported and adapted to the live TrinityCore 3.3.5 schema by Iceymidgit.
--
--  'Sparky Skyfire' firework/fireworks vendor (entry 604000) with a 20-item stock.
-- =============================================================================

USE world;

-- ######################################################
--  NPC VENDOR TEMPLATE - 604000
-- ######################################################
SET
@Entry      := 604000,
@Model      := 7181,            -- Goblin
@Name       := "Sparky Skyfire",
@Title      := "Fireworks",
@Icon       := "Buy",
@GossipMenu := 0,
@MinLevel   := 80,
@MaxLevel   := 80,
@Faction    := 35,              -- Friendly to all
@NPCFlag    := 128,             -- Vendor
@Scale      := 1.0,
@Rank       := 0,
@Type       := 7,               -- Humanoid
@TypeFlags  := 0,
@FlagsExtra := 2,               -- CREATURE_FLAG_EXTRA_CIVILIAN
@AIName     := "SmartAI",
@Script     := "";

-- NPC (creature_template) -- InhabitType column intentionally removed for TC 3.3.5
DELETE FROM `creature_template` WHERE `entry` = @Entry;
INSERT INTO `creature_template`
    (`entry`, `modelid1`, `name`, `subname`, `IconName`, `gossip_menu_id`,
     `minlevel`, `maxlevel`, `faction`, `npcflag`, `speed_walk`, `speed_run`,
     `scale`, `rank`, `unit_class`, `unit_flags`, `type`, `type_flags`,
     `RegenHealth`, `flags_extra`, `AIName`, `ScriptName`)
VALUES
    (@Entry, @Model, @Name, @Title, @Icon, @GossipMenu,
     @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286,
     @Scale, @Rank, 1, 2, @Type, @TypeFlags,
     1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIP (explicit columns -- portable & safe)
DELETE FROM `creature_equip_template` WHERE `CreatureID` = @Entry AND `ID` = 1;
INSERT INTO `creature_equip_template`
    (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`)
VALUES
    (@Entry, 1, 2884, 0, 0); -- Dynamite Stick (mainhand), none, none

-- NPC VENDOR ITEMS (npc_vendor schema is compatible between AC and TC 3.3.5)
DELETE FROM `npc_vendor` WHERE `entry` = @Entry;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(@Entry, 41427),  -- Dalaran Firework
(@Entry, 34599),  -- Juggling Torch
(@Entry, 23771),  -- Green Smoke Flare
(@Entry, 23768),  -- White Smoke Flare
(@Entry, 21747),  -- Festival Firecracker
(@Entry, 21745),  -- Elder's Moonstone
(@Entry, 21744),  -- Lucky Rocket Cluster
(@Entry, 21713),  -- Elune's Candle
(@Entry, 34850),  -- Midsummer Ground Flower
(@Entry, 21576),  -- Red Rocket Cluster
(@Entry, 21574),  -- Green Rocket Cluster
(@Entry, 21571),  -- Blue Rocket Cluster
(@Entry, 21570),  -- Cluster Launcher
(@Entry, 19026),  -- Snake Burst Firework
(@Entry,  9318),  -- Red Firework
(@Entry,  9315),  -- Yellow Rose Firework
(@Entry,  9314),  -- Red Streaks Firework
(@Entry,  9313),  -- Green Firework
(@Entry,  9312),  -- Blue Firework
(@Entry,  8626);  -- Blue Sparkler
