-- =============================================================================
--  Critter NPC Template
--  TrinityCore 3.3.5  (TDB 25101 world schema)
--
--  Original content by StygianTheBest (AzerothCore-Content project).
--  Ported and adapted to the live TrinityCore 3.3.5 schema by Iceymidgit.
--
--  creature_template for a harmless critter, translated to TC (InhabitType removed, AIName casing fixed). NOTE: uses entry 604000 — clashes with the Firework Vendor; change one @Entry if importing both.
-- =============================================================================

USE world;

-- ######################################################--
--	NPC CRITTER TEMPLATE - 604000
-- ######################################################--
SET
@Entry 		:= 604000,
@Model 		:= 1060, -- Cow
@Name 		:= "Cowlie",
@Title 		:= "The Milker",
@Icon 		:= NULL,
@GossipMenu := 0,
@MinLevel 	:= 1,
@MaxLevel 	:= 1,
@Faction 	:= 190,
@NPCFlag 	:= 0,
@Scale		:= 1.0,
@Rank		:= 0,
@Type 		:= 8,	-- Critter
@TypeFlags 	:= 0,
@FlagsExtra := 0,
@AIName		:= "SmartAI",
@Script 	:= "";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, RegenHealth, flags_extra, AIName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 1, @FlagsExtra, @AIName, @Script);

-- END OF LINE
