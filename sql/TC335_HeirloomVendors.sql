-- =============================================================================
--  Heirloom Vendors (Starting Zones)
--  TrinityCore 3.3.5  (TDB 25101 world schema)
--
--  Original content by StygianTheBest (AzerothCore-Content project).
--  Ported and adapted to the live TrinityCore 3.3.5 schema by Iceymidgit.
--
--  Spawns 'Glowing Soul' heirloom vendors in the race starting zones (entry 601704, guids 601704-601713) and prices their stock. Port fixes: positional creature_template insert rewritten with explicit TC columns; AC npc_text emote columns replaced with TC-compatible text; spawndist renamed to wander_distance.
-- =============================================================================

USE world;

-- ######################################################--
--	HEIRLOOM VENDOR - 601017
-- ######################################################--

-- Ref vendor and set a higher guid for spawned creature
SET @BoA :=601704;
SET @guid :=601704;

DELETE FROM `creature_template` WHERE `entry`=@BoA;
INSERT INTO `creature_template`
 (`entry`,`modelid1`,`name`,`subname`,`gossip_menu_id`,`minlevel`,`maxlevel`,`faction`,`npcflag`,`scale`,`unit_class`,`type`,`RegenHealth`,`flags_extra`,`AIName`)
VALUES
 (@BoA,25900,'Glowing Soul','Heirloom Merchant',0,80,80,35,128,1,1,7,1,2,'');

-- Text
DELETE FROM `npc_text` WHERE `ID`=601017;
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`Probability0`) VALUES
 (601017,'Greetings $N. I carry artifacts forged from the old world to help you in your journey.','Greetings $N. I carry artifacts forged from the old world to help you in your journey.',1);

-- Items
DELETE FROM `npc_vendor` WHERE `entry`=@BoA;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`) VALUES 
(@BoA,0,42943,0,0,0), -- Bloodied Arcanite Reaper
(@BoA,0,42944,0,0,0), -- Balanced Heartseeker
(@BoA,0,42945,0,0,0), -- Venerable Dal'Rend's Sacred Charge
(@BoA,0,42946,0,0,0), -- Charmed Ancient Bone Bow
(@BoA,0,42947,0,0,0), -- Dignified Headmaster's Charge
(@BoA,0,42948,0,0,0), -- Devout Aurastone Hammer
(@BoA,0,42949,0,0,0), -- Polished Spaulders of Valor
(@BoA,0,42950,0,0,0), -- Champion Herod's Shoulder
(@BoA,0,42951,0,0,0), -- Mystical Pauldrons of Elements
(@BoA,0,42952,0,0,0), -- Stained Shadowcraft Spaulders
(@BoA,0,42984,0,0,0), -- Preened Ironfeather Shoulders
(@BoA,0,42985,0,0,0), -- Tattered Dreadmist Mantle
(@BoA,0,42991,0,0,0), -- Swift Hand of Justice
(@BoA,0,42992,0,0,0), -- Discerning Eye of the Beast
(@BoA,0,44091,0,0,0), -- Sharpened Scarlet Kris
(@BoA,0,44092,0,0,0), -- Reforged Truesilver Champion
(@BoA,0,44093,0,0,0), -- Upgraded Dwarven Hand Cannon
(@BoA,0,44094,0,0,0), -- The Blessed Hammer of Grace
(@BoA,0,44095,0,0,0), -- Grand Staff of Jordan
(@BoA,0,44096,0,0,0), -- Battleworn Thrash Blade
(@BoA,0,44097,0,0,0), -- Inherited Insignia of the Horde
(@BoA,0,44098,0,0,0), -- Inherited Insignia of the Alliance
(@BoA,0,44099,0,0,0), -- Strengthened Stockade Pauldrons
(@BoA,0,44100,0,0,0), -- Pristine Lightforge Spaulders
(@BoA,0,44101,0,0,0), -- Prized Beastmaster's Mantle
(@BoA,0,44102,0,0,0), -- Aged Pauldrons of The Five Thunders
(@BoA,0,44103,0,0,0), -- Exceptional Stormshroud Shoulders
(@BoA,0,44105,0,0,0), -- Lasting Feralheart Spaulders
(@BoA,0,44107,0,0,0), -- Exquisite Sunderseer Mantle
(@BoA,0,48677,0,0,0), -- Champion's Deathdealer Breastplate
(@BoA,0,48685,0,0,0), -- Polished Breastplate of Valor
(@BoA,0,48687,0,0,0), -- Preened Ironfeather Breastplate
(@BoA,0,48689,0,0,0), -- Stained Shadowcraft Tunic
(@BoA,0,48683,0,0,0), -- Mystical Vest of Elements
(@BoA,0,48691,0,0,0), -- Tattered Dreadmist Robe
(@BoA,0,48716,0,0,0), -- Venerable Mass of McGowan
(@BoA,0,48718,0,0,0), -- Repurposed Lava Dredger
(@BoA,0,50255,0,0,0); -- Dread Pirate Ring


-- ######################################################--
--	NPC SPAWN POINTS
-- ######################################################--

DELETE FROM `creature` WHERE `id`=@BoA;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES 
(@guid,@BoA,0,1,1,0,0,-9022.275391,-76.134964,88.489632,5.9219,100,0,0,4274,3994,0,0,0,0), -- Human (Northshire Valley)
(@guid+1,@BoA,0,1,1,0,0,-6170.66,350.627,400.116,1.93837,100,0,0,4274,3994,0,0,0,0), -- Dwarf and Gnome (Coldridge Valley)
(@guid+2,@BoA,1,1,1,0,0,10411.7,781.667,1322.71,5.26217,100,0,0,4274,3994,0,0,0,0), -- NightElf (Shadowglen)
(@guid+3,@BoA,530,1,1,0,0,-4112.79,-13749,73.5646,4.35504,100,0,0,4274,3994,0,0,0,0), -- Draenei (Crash Site)
(@guid+4,@BoA,1,1,1,0,0,-597.151,-4210.22,38.4318,4.08879,100,0,0,4274,3994,0,0,0,0), -- Orc and Troll (Valley of Trial)
(@guid+5,@BoA,0,1,1,0,0,1883.85,1614.12,93.4042,4.55138,100,0,0,4274,3994,0,0,0,0), -- Undead (Deathknell)
(@guid+6,@BoA,1,1,1,0,0,-2899.01,-231.723,53.8403,4.66684,100,0,0,4274,3994,0,0,0,0), -- Tauren (Camp Narache)
(@guid+7,@BoA,530,1,1,0,0,10359.4,-6408.47,38.5311,1.88496,100,0,0,4274,3994,0,0,0,0), -- BloodElf (The Sunspire)
(@guid+8,@BoA,609,1,1,0,0,2435.74,-5610.41,420.092,3.71887,100,0,0,4274,3994,0,0,0,0), -- DeathKnight (The Heart of Acherus) #1
(@guid+9,@BoA,0,1,1,0,0,2435.74,-5610.41,420.092,3.71887,100,0,0,4274,3994,0,0,0,0); -- DeathKnight (The Heart of Acherus) #2


-- ######################################################--
--	CURRENCY CONVERSION
-- ######################################################--
SET @1C :=1;				--	   1 Copper
SET @1S :=100;				--	   1 Silver
SET @5S :=500;				--	   5 Silver
SET @10S :=1000;			--	   10 Silver
SET @25S :=2500;			--	   25 Silver
SET @50S :=5000;			--	   50 Silver
SET @75S :=7500;			--	   75 Silver
SET @1G :=10000; 			--     1 Gold
SET @2G :=20000; 			--     2 Gold
SET @3G :=30000; 			--     3 Gold
SET @4G :=40000; 			--     4 Gold
SET @5G :=50000; 			--     5 Gold
SET @10G :=100000; 			--    10 Gold
SET @15G :=150000; 			--    15 Gold
SET @18G :=180000; 			--    18 Gold
SET @20G :=200000; 			--    20 Gold
SET @25G :=250000; 			--    25 Gold
SET @30G :=300000; 			--    30 Gold
SET @40G :=400000; 			--    40 Gold
SET @50G :=500000; 			--    50 Gold
SET @75G :=750000; 			--    75 Gold
SET @100G :=1000000; 		--   100 Gold
SET @250G :=2500000; 		--   250 Gold
SET @300G :=3000000; 		--   300 Gold
SET @350G :=3500000; 		--   350 Gold
SET @375G :=3750000; 		--   375 Gold
SET @500G :=5000000; 		--   500 Gold
SET @750G :=7500000; 		--   750 Gold
SET @1000G :=10000000; 		--  1000 Gold
SET @1500G :=15000000; 		--  1500 Gold
SET @2500G :=25000000; 		--  2500 Gold
SET @5000G :=50000000; 		--  5000 Gold
SET @7500G :=75000000; 		--  7500 Gold
SET @10000G :=100000000; 	-- 10000 Gold
SET @12500G :=125000000; 	-- 12500 Gold
SET @15000G :=150000000; 	-- 15000 Gold
SET @20000G :=200000000; 	-- 20000 Gold
SET @25000G :=250000000; 	-- 20000 Gold
SET @50000G :=500000000; 	-- 50000 Gold
SET @75000G :=750000000; 	-- 75000 Gold


-- ######################################################--
--	HEIRLOOM PRICES
-- ######################################################--

UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 42943;  -- Bloodied Arcanite Reaper
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 42944;  -- Balanced Heartseeker
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 42945;  -- Venerable Dal'Rend's Sacred Charge
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 42946;  -- Charmed Ancient Bone Bow
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 42947;  -- Dignified Headmaster's Charge
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 42948;  -- Devout Aurastone Hammer
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42949; -- Polished Spaulders of Valor
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42950; -- Champion Herod's Shoulder
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42951; -- Mystical Pauldrons of Elements
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42952; -- Stained Shadowcraft Spaulders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42984; -- Preened Ironfeather Shoulders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42985; -- Tattered Dreadmist Mantle
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 42991;  -- Swift Hand of Justice
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 42992;  -- Discerning Eye of the Beast
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 44091;  -- Sharpened Scarlet Kris
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 44092;  -- Reforged Truesilver Champion
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 44093;  -- Upgraded Dwarven Hand Cannon
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 44094;  -- The Blessed Hammer of Grace
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 44095;  -- Grand Staff of Jordan
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 44096;  -- Battleworn Thrash Blade
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 44097;  -- Inherited Insignia of the Horde
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 44098;  -- Inherited Insignia of the Alliance
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44099; -- Strengthened Stockade Pauldrons
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44100; -- Pristine Lightforge Spaulders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44101; -- Prized Beastmaster's Mantle
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44102; -- Aged Pauldrons of The Five Thunders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44103; -- Exceptional Stormshroud Shoulders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44105; -- Lasting Feralheart Spaulders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44107; -- Exquisite Sunderseer Mantle
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48677; -- Champion's Deathdealer Breastplate
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48685; -- Polished Breastplate of Valor
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48687; -- Preened Ironfeather Breastplate
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48689; -- Stained Shadowcraft Tunic
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48683; -- Mystical Vest of Elements
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48691; -- Tattered Dreadmist Robe
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 48716;  -- Venerable Mass of McGowan
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 48718;  -- Repurposed Lava Dredger
UPDATE item_template SET sellprice=@5G, buyprice=@500G WHERE entry = 50255;  -- Dread Pirate Ring
