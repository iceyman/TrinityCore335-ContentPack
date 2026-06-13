-- =============================================================================
--  New Adventurer Starter Kit — Full Outfit (quest-based)
--  TrinityCore 3.3.5  (TDB 25101 world schema)
--
--  Created by Iceymidgit.
--
--  A 'Quartermaster' NPC (entry 604003) in every starting zone offers a one-time, class-locked quest. Reward: 2x Netherweave Bag + heirloom chest + shoulders + weapon matched to the class's armor type, plus 3 silver. Once per CHARACTER — the offer vanishes after turn-in; a remade character gets its own copy. Account-bound gear + pocket-change gold means nothing is worth farming. Shares NPC entry 604003 and quest IDs 60001-60011 with the XP version — import ONE.
-- =============================================================================

USE world;

DELETE FROM `creature_template` WHERE `entry`=604003;
INSERT INTO `creature_template`
 (`entry`,`modelid1`,`name`,`subname`,`minlevel`,`maxlevel`,`faction`,`npcflag`,`scale`,`unit_class`,`type`,`RegenHealth`,`flags_extra`,`AIName`)
 VALUES (604003,19726,'Quartermaster','New Adventurers',80,80,35,2,1,1,7,1,2,'');

-- ---- One class-locked quest per class ----
DELETE FROM `quest_template` WHERE `ID`=60001;
INSERT INTO `quest_template`
 (`ID`,`QuestType`,`QuestLevel`,`MinLevel`,`AllowableRaces`,`Flags`,`RewardMoney`,
  `RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardItem3`,`RewardAmount3`,`RewardItem4`,`RewardAmount4`,
  `LogTitle`,`QuestDescription`)
 VALUES (60001,2,-1,0,0,0,300, 21841,2, 48685,1, 42949,1, 42943,1, 'Warrior Starter Kit','Welcome to the realm, $N! As a fledgling Warrior you''ll need supplies. Accept this and I''ll outfit you with bags, armor, a weapon and a little coin.');
DELETE FROM `quest_template_addon` WHERE `ID`=60001;
INSERT INTO `quest_template_addon` (`ID`,`AllowableClasses`,`SpecialFlags`) VALUES (60001,1,0);
DELETE FROM `quest_template` WHERE `ID`=60002;
INSERT INTO `quest_template`
 (`ID`,`QuestType`,`QuestLevel`,`MinLevel`,`AllowableRaces`,`Flags`,`RewardMoney`,
  `RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardItem3`,`RewardAmount3`,`RewardItem4`,`RewardAmount4`,
  `LogTitle`,`QuestDescription`)
 VALUES (60002,2,-1,0,0,0,300, 21841,2, 48685,1, 42949,1, 42943,1, 'Paladin Starter Kit','Welcome to the realm, $N! As a fledgling Paladin you''ll need supplies. Accept this and I''ll outfit you with bags, armor, a weapon and a little coin.');
DELETE FROM `quest_template_addon` WHERE `ID`=60002;
INSERT INTO `quest_template_addon` (`ID`,`AllowableClasses`,`SpecialFlags`) VALUES (60002,2,0);
DELETE FROM `quest_template` WHERE `ID`=60003;
INSERT INTO `quest_template`
 (`ID`,`QuestType`,`QuestLevel`,`MinLevel`,`AllowableRaces`,`Flags`,`RewardMoney`,
  `RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardItem3`,`RewardAmount3`,`RewardItem4`,`RewardAmount4`,
  `LogTitle`,`QuestDescription`)
 VALUES (60003,2,-1,0,0,0,300, 21841,2, 48677,1, 42950,1, 42946,1, 'Hunter Starter Kit','Welcome to the realm, $N! As a fledgling Hunter you''ll need supplies. Accept this and I''ll outfit you with bags, armor, a weapon and a little coin.');
DELETE FROM `quest_template_addon` WHERE `ID`=60003;
INSERT INTO `quest_template_addon` (`ID`,`AllowableClasses`,`SpecialFlags`) VALUES (60003,4,0);
DELETE FROM `quest_template` WHERE `ID`=60004;
INSERT INTO `quest_template`
 (`ID`,`QuestType`,`QuestLevel`,`MinLevel`,`AllowableRaces`,`Flags`,`RewardMoney`,
  `RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardItem3`,`RewardAmount3`,`RewardItem4`,`RewardAmount4`,
  `LogTitle`,`QuestDescription`)
 VALUES (60004,2,-1,0,0,0,300, 21841,2, 48689,1, 42952,1, 42944,1, 'Rogue Starter Kit','Welcome to the realm, $N! As a fledgling Rogue you''ll need supplies. Accept this and I''ll outfit you with bags, armor, a weapon and a little coin.');
DELETE FROM `quest_template_addon` WHERE `ID`=60004;
INSERT INTO `quest_template_addon` (`ID`,`AllowableClasses`,`SpecialFlags`) VALUES (60004,8,0);
DELETE FROM `quest_template` WHERE `ID`=60005;
INSERT INTO `quest_template`
 (`ID`,`QuestType`,`QuestLevel`,`MinLevel`,`AllowableRaces`,`Flags`,`RewardMoney`,
  `RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardItem3`,`RewardAmount3`,`RewardItem4`,`RewardAmount4`,
  `LogTitle`,`QuestDescription`)
 VALUES (60005,2,-1,0,0,0,300, 21841,2, 48691,1, 42985,1, 42947,1, 'Priest Starter Kit','Welcome to the realm, $N! As a fledgling Priest you''ll need supplies. Accept this and I''ll outfit you with bags, armor, a weapon and a little coin.');
DELETE FROM `quest_template_addon` WHERE `ID`=60005;
INSERT INTO `quest_template_addon` (`ID`,`AllowableClasses`,`SpecialFlags`) VALUES (60005,16,0);
DELETE FROM `quest_template` WHERE `ID`=60006;
INSERT INTO `quest_template`
 (`ID`,`QuestType`,`QuestLevel`,`MinLevel`,`AllowableRaces`,`Flags`,`RewardMoney`,
  `RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardItem3`,`RewardAmount3`,`RewardItem4`,`RewardAmount4`,
  `LogTitle`,`QuestDescription`)
 VALUES (60006,2,-1,0,0,0,300, 21841,2, 48685,1, 42949,1, 42943,1, 'Death Knight Starter Kit','Welcome to the realm, $N! As a fledgling Death Knight you''ll need supplies. Accept this and I''ll outfit you with bags, armor, a weapon and a little coin.');
DELETE FROM `quest_template_addon` WHERE `ID`=60006;
INSERT INTO `quest_template_addon` (`ID`,`AllowableClasses`,`SpecialFlags`) VALUES (60006,32,0);
DELETE FROM `quest_template` WHERE `ID`=60007;
INSERT INTO `quest_template`
 (`ID`,`QuestType`,`QuestLevel`,`MinLevel`,`AllowableRaces`,`Flags`,`RewardMoney`,
  `RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardItem3`,`RewardAmount3`,`RewardItem4`,`RewardAmount4`,
  `LogTitle`,`QuestDescription`)
 VALUES (60007,2,-1,0,0,0,300, 21841,2, 48683,1, 42951,1, 42948,1, 'Shaman Starter Kit','Welcome to the realm, $N! As a fledgling Shaman you''ll need supplies. Accept this and I''ll outfit you with bags, armor, a weapon and a little coin.');
DELETE FROM `quest_template_addon` WHERE `ID`=60007;
INSERT INTO `quest_template_addon` (`ID`,`AllowableClasses`,`SpecialFlags`) VALUES (60007,64,0);
DELETE FROM `quest_template` WHERE `ID`=60008;
INSERT INTO `quest_template`
 (`ID`,`QuestType`,`QuestLevel`,`MinLevel`,`AllowableRaces`,`Flags`,`RewardMoney`,
  `RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardItem3`,`RewardAmount3`,`RewardItem4`,`RewardAmount4`,
  `LogTitle`,`QuestDescription`)
 VALUES (60008,2,-1,0,0,0,300, 21841,2, 48691,1, 42985,1, 42947,1, 'Mage Starter Kit','Welcome to the realm, $N! As a fledgling Mage you''ll need supplies. Accept this and I''ll outfit you with bags, armor, a weapon and a little coin.');
DELETE FROM `quest_template_addon` WHERE `ID`=60008;
INSERT INTO `quest_template_addon` (`ID`,`AllowableClasses`,`SpecialFlags`) VALUES (60008,128,0);
DELETE FROM `quest_template` WHERE `ID`=60009;
INSERT INTO `quest_template`
 (`ID`,`QuestType`,`QuestLevel`,`MinLevel`,`AllowableRaces`,`Flags`,`RewardMoney`,
  `RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardItem3`,`RewardAmount3`,`RewardItem4`,`RewardAmount4`,
  `LogTitle`,`QuestDescription`)
 VALUES (60009,2,-1,0,0,0,300, 21841,2, 48691,1, 42985,1, 42947,1, 'Warlock Starter Kit','Welcome to the realm, $N! As a fledgling Warlock you''ll need supplies. Accept this and I''ll outfit you with bags, armor, a weapon and a little coin.');
DELETE FROM `quest_template_addon` WHERE `ID`=60009;
INSERT INTO `quest_template_addon` (`ID`,`AllowableClasses`,`SpecialFlags`) VALUES (60009,256,0);
DELETE FROM `quest_template` WHERE `ID`=60011;
INSERT INTO `quest_template`
 (`ID`,`QuestType`,`QuestLevel`,`MinLevel`,`AllowableRaces`,`Flags`,`RewardMoney`,
  `RewardItem1`,`RewardAmount1`,`RewardItem2`,`RewardAmount2`,`RewardItem3`,`RewardAmount3`,`RewardItem4`,`RewardAmount4`,
  `LogTitle`,`QuestDescription`)
 VALUES (60011,2,-1,0,0,0,300, 21841,2, 48687,1, 42984,1, 42947,1, 'Druid Starter Kit','Welcome to the realm, $N! As a fledgling Druid you''ll need supplies. Accept this and I''ll outfit you with bags, armor, a weapon and a little coin.');
DELETE FROM `quest_template_addon` WHERE `ID`=60011;
INSERT INTO `quest_template_addon` (`ID`,`AllowableClasses`,`SpecialFlags`) VALUES (60011,1024,0);

-- ---- Link quests to the Quartermaster ----
DELETE FROM `creature_queststarter` WHERE `id`=604003;
DELETE FROM `creature_questender` WHERE `id`=604003;
INSERT INTO `creature_queststarter` (`id`,`quest`) VALUES (604003,60001),(604003,60002),(604003,60003),(604003,60004),(604003,60005),(604003,60006),(604003,60007),(604003,60008),(604003,60009),(604003,60011);
INSERT INTO `creature_questender` (`id`,`quest`) VALUES (604003,60001),(604003,60002),(604003,60003),(604003,60004),(604003,60005),(604003,60006),(604003,60007),(604003,60008),(604003,60009),(604003,60011);

-- ---- Spawns: one per starting zone ----
DELETE FROM `creature` WHERE `id`=604003;
INSERT INTO `creature`
 (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`)
 VALUES
(601720,604003,0,1,1,0,0,-9022.27,-76.13,88.49,5.92,300,0,0,1,1,0,2,0,0),
(601721,604003,0,1,1,0,0,-6170.66,350.627,400.116,1.938,300,0,0,1,1,0,2,0,0),
(601722,604003,1,1,1,0,0,10411.7,781.667,1322.71,5.262,300,0,0,1,1,0,2,0,0),
(601723,604003,530,1,1,0,0,-4112.79,-13749,73.56,4.355,300,0,0,1,1,0,2,0,0),
(601724,604003,1,1,1,0,0,-597.151,-4210.22,38.43,4.088,300,0,0,1,1,0,2,0,0),
(601725,604003,0,1,1,0,0,1883.85,1614.12,93.4,4.551,300,0,0,1,1,0,2,0,0),
(601726,604003,1,1,1,0,0,-2899.01,-231.723,53.84,4.666,300,0,0,1,1,0,2,0,0),
(601727,604003,530,1,1,0,0,10359.4,-6408.47,38.53,1.884,300,0,0,1,1,0,2,0,0),
(601728,604003,609,1,1,0,0,2435.74,-5610.41,420.09,3.718,300,0,0,1,1,0,2,0,0);
