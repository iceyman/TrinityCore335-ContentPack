-- =============================================================================
--  Tome of World Flying
--  TrinityCore 3.3.5  (TDB 25101 world schema)
--
--  Original content by StygianTheBest (AzerothCore-Content project).
--  Ported and adapted to the live TrinityCore 3.3.5 schema by Iceymidgit.
--
--  Adds item 701000 'Tome of World Flying' (use it to learn spell 31700, flight
--  in the old-world zones), retints mount NPC 32568's models, sells the tome at
--  15 flight masters, and adds a disables row so flying stays off in battlegrounds.
--  NOTE: the 15 vendor NPCs must have the vendor npcflag for the tome to appear;
--  flight masters that aren't vendors simply won't show it (harmless).
-- =============================================================================
USE world;

DELETE FROM `item_template` where `entry` = 701000;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES 
(701000, 9, 0, 'Tome of World Flying', 61330, 7, 134217792, 0, 1, 4500000, 4500000, 0, -1, -1, 80, 45, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 483, 0, -1, 0, -1, 0, -1, 31700, 6, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 'Learn to fly everywhere', 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1);

-- UPDATE MOUNTS MODELS
-- 31803 -- Blazing Hippogryph
-- 17722 -- Wind Rider
-- 31958 -- Celestial Steed
-- 32728 -- Furor's Fabled Steed (Brazen Taxi)
-- 28040 -- Black Proto-Drake
UPDATE `creature_template` set `modelid1` = 31803 where `entry` = 32568; -- Blazing Hippogryph
UPDATE `creature_template` set `modelid2` = 17722 where `entry` = 32568; -- Swift Yellow Wind Rider
-- UPDATE `creature_template` set `modelid2` = 18164 where `entry` = 32568; -- Furor's Fabled Steed (Brazen Taxi)
UPDATE `creature_template` set `modelid3` = 31958 where `entry` = 32568; -- Celestial Steed
UPDATE `creature_template` set `modelid4` = 28040 where `entry` = 32568; -- Black Proto-Drake


-- ######################################################--
--	REMOVE TOME OF FLYING VENDOR ITEMS
-- ######################################################--
DELETE FROM npc_vendor
WHERE item = 701000 AND entry IN (384, 35101, 4731, 35099, 32216, 3362, 3685, 7952, 16264, 1261, 7955, 4730, 17584, 35131, 35132);
-- ADD ITEM TO VENDORS
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
('384','0','701000','0','0','0'),
('35101','0','701000','0','0','0'),
('4731','0','701000','0','0','0'),
('35099','0','701000','0','0','0'),
('32216','0','701000','0','0','0'),
('3362','0','701000','0','0','0'),
('3685','0','701000','0','0','0'),
('7952','0','701000','0','0','0'),
('16264','0','701000','0','0','0'),
('1261','0','701000','0','0','0'),
('7955','0','701000','0','0','0'),
('4730','0','701000','0','0','0'),
('17584','0','701000','0','0','0'),
('35131','0','701000','0','0','0'),
('35132','0','701000','0','0','0');

-- ######################################################--
--	DISABLE BG FLYING
-- ######################################################--
DELETE FROM `disables` WHERE `sourceType`=0 AND `entry`=31700;
INSERT INTO `disables` VALUES (0, 31700, 17, '489,529,30,566,607,628', '', 'Battleground Flying Disable');
