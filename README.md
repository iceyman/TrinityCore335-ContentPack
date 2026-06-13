# TrinityCore 3.3.5 Content Pack — Full Documentation

Ported from **StygianTheBest's** AzerothCore-Content pack (and a couple of
Rochet2 scripts), adapted to the live **TrinityCore 3.3.5** world schema and
tested against **TDB full world 335.25101 (2025-10-21)**. Assembled by
**Iceymidgit**. Original content credited to its authors throughout; new content
(the starter kits) is original.

> Every file in this pack was import-tested against a real TDB world database
> before release. The `Mall` module is still being finalised and is **not** part
> of this documented set yet.

---

## Table of contents

1. [How to import](#how-to-import)
2. [ID ranges at a glance](#id-ranges-at-a-glance)
3. [Known collisions](#known-collisions)
4. [Files](#files)
   - [Starter Kit — Full Outfit](#1-tc335_starterkitquestsql)
   - [Starter Kit — XP / Fast-Leveling](#2-tc335_starterkitquest_xpsql)
   - [Starter Kit — C++ companion (superseded)](#3-tc335_starterkitsql)
   - [Teleporter](#4-tc335_teleportersql)
   - [Portal Master](#5-tc335_portalmastersql)
   - [Heirloom Vendors](#6-tc335_heirloomvendorssql)
   - [Firework Vendor](#7-tc335_npcvendortemplatesql)
   - [Critter](#8-tc335_npccritertemplatesql)
   - [Profession Trainer](#9-tc335_npctrainertemplatesql)
   - [Tome of World Flying](#10-tc335_tomeofworldflyingsql)
   - [Gift Box Sender](#11-tc335_giftboxsendersql)
   - [Silithus Fishing Camp](#12-tc335_silithuscampsql)
   - [Jukebox](#13-tc335_jukeboxsql)
   - [Price / vendor tweaks](#14-price-and-vendor-tweaks)

---

## How to import

Each file targets your **world** database. Import with:

```bash
mysql -u <user> -p world < sql/TC335_Teleporter.sql
```

Then restart `worldserver`, or in-game use `.reload` on the relevant tables
(e.g. `.reload creature_template`, `.reload gossip_menu`, `.reload conditions`,
`.reload smart_scripts`, `.reload trainer`). To place an NPC where you want it,
target an empty spot and run `.npc add <entry>` — files that already include a
`creature` spawn are noted below.

After importing trainer or SmartAI content, a full `worldserver` restart is the
safest way to make sure everything is registered.

---

## ID ranges at a glance

| Thing | Range used |
|---|---|
| Custom creature_template entries | 601000–604003, 60500 |
| Custom item entries | 60001–60008 (gift boxes), 701000 (flying tome) |
| Custom quest IDs | 60001–60011 (starter kits) |
| Custom creature GUIDs | 601704–601713, 601720–601728, 1994210, 1995303–1995315 |
| Gameobject GUIDs | 500467, 500469, 500694, 500802, 500927 |
| Gossip menu IDs | 50000–50009 (portals), Jukebox menus |

---

## Known collisions

These only matter if you import **both** of a pair:

- **Firework Vendor** and **Critter** both use creature_template entry
  **604000**. Change one `@Entry` if you want both.
- The **two Starter Kit quest files** share NPC entry **604003** and quest IDs
  **60001–60011**. Import **one** of them, not both (last import wins).
- **Gift boxes** (items 60001–60008) and **starter-kit quests** (IDs 60001–60011)
  live in different tables (`item_template` vs `quest_template`), so they do
  **not** collide.

---

## Files

### 1. `TC335_StarterKitQuest.sql`
**New Adventurer Starter Kit — Full Outfit.** *(Original content by Iceymidgit.)*

A **Quartermaster** NPC (entry **604003**) stands in every starting zone (9
spawns, GUIDs **601720–601728**) and offers a one-time, class-locked quest
(IDs **60001–60011**, gated via `quest_template_addon.AllowableClasses`).

**Reward:** 2× Netherweave Bag (16-slot) + a heirloom **chest**, **shoulders**
and **weapon** matched to the class's armour type, plus **3 silver**.

| Armour | Classes | Chest / Shoulders |
|---|---|---|
| Plate | Warrior, Paladin, Death Knight | 48685 / 42949 |
| Mail | Hunter (48677/42950), Shaman (48683/42951) | |
| Leather | Rogue (48689/42952), Druid (48687/42984) | |
| Cloth | Priest, Mage, Warlock | 48691 / 42985 |

Once per **character** (the offer vanishes after turn-in; a remade character gets
its own copy). Account-bound gear + pocket-change gold means nothing worth
farming.

**Import:** drop in, restart/`.reload`. The Quartermasters appear automatically.

---

### 2. `TC335_StarterKitQuest_XP.sql`
**New Adventurer Starter Kit — XP / Fast-Leveling.** *(Iceymidgit.)*

Same Quartermaster (entry **604003**, quests **60001–60011**). **Reward:** 2×
Netherweave Bag + heirloom **chest** + heirloom **shoulders** (each grants +10%
experience, **+20% combined**) matched to the class's armour type, plus 3 silver.
**No weapon.**

> Shares the NPC entry and quest IDs with file #1 — **import only one** of the two.

---

### 3. `TC335_StarterKit.sql`
**C++ module companion — SUPERSEDED.** *(Iceymidgit.)*

The older once-per-**account** approach: SQL data for a `StarterKit` C++
PlayerScript. Superseded by the quest-based files above (which need no recompile).
Kept for reference only — you almost certainly want #1 or #2 instead.

---

### 4. `TC335_Teleporter.sql`
**City / Zone Teleporter.** *(Destinations from StygianTheBest's
PersonalTeleporter; rebuilt natively for TC by Iceymidgit.)*

A **Portal Keeper** NPC (entry **604001**) offering **131 teleport destinations**
with gossip-page navigation. The AzerothCore original relied on a core-side
script; this is a from-scratch native TrinityCore gossip build. Dungeons are
omitted on purpose — use the in-game LFG tool.

**Use:** `.npc add 604001`, then right-click the Portal Keeper.

---

### 5. `TC335_PortalMaster.sql`
**Faction-aware city/dungeon teleporter.** *(Rochet2 / StygianTheBest, ported by
Iceymidgit.)*

A **SmartAI** gossip teleporter whose destinations are gated by faction through
the `conditions` table — Alliance and Horde each see their own list. Contains
**151 gossip options** across **11 menus**, **131 faction conditions** and **133
SmartAI teleport scripts**. Uses gossip menu IDs **50000–50009**.

Ported cleanly because it was already SmartAI-driven (no core script). Port fixes:
`InhabitType` removed, `AiName`→`AIName`, `creature_template_addon` bytes columns
dropped, `spawndist`→`wander_distance`, gossip/`npc_text` columns renamed to TC.

---

### 6. `TC335_HeirloomVendors.sql`
**Heirloom vendors in the starting zones.** *(StygianTheBest, ported by
Iceymidgit.)*

Spawns **"Glowing Soul"** heirloom vendors (entry **601704**, GUIDs
**601704–601713**) in the race starting zones and prices their stock. Port fixes:
positional `creature_template` insert rewritten with explicit TC columns, AC
`npc_text` emote columns replaced, `spawndist`→`wander_distance`.

---

### 7. `TC335_NPCVendorTemplate.sql`
**Firework vendor.** *(StygianTheBest, ported by Iceymidgit.)*

**"Sparky Skyfire"** (entry **604000**) with a 20-item firework stock.
⚠️ Shares entry 604000 with the Critter — change one if importing both.

**Use:** `.npc add 604000`.

---

### 8. `TC335_NPCCritterTemplate.sql`
**Critter template.** *(StygianTheBest, ported by Iceymidgit.)*

A harmless critter, **"Cowlie"** (entry **604000**), translated to TC
(`InhabitType` removed, `AIName` casing fixed). ⚠️ Same 604000 collision as the
Firework Vendor.

---

### 9. `TC335_NPCTrainerTemplate.sql`
**Grandmaster Alchemy trainer (template).** *(StygianTheBest, ported by
Iceymidgit.)*

TrinityCore overhauled trainers: the old `creature_template` trainer columns are
gone, replaced by the `trainer` / `trainer_spell` / `creature_default_trainer`
tables. This NPC (entry **60500**) is wired to the game's existing Alchemy list
(**TrainerId 75** — the same list Linzy Blackbolt uses) so it teaches **30 real
spells** out of the box. A commented scaffold at the bottom shows how to build
your own custom spell list.

**Use:** `.npc add 60500`.

---

### 10. `TC335_TomeOfWorldFlying.sql`
**Tome of World Flying.** *(StygianTheBest, ported by Iceymidgit.)*

Adds item **701000** "Tome of World Flying" (use it to learn the old-world flying
spell), sells it at **15 flight masters**, and adds a `disables` row so flying
stays off in battlegrounds. Every one of the item's ~130 columns was matched to
the TC schema.

> Note: the 15 vendor NPCs must carry the vendor `npcflag` for the tome to appear;
> flight masters that aren't vendors simply won't show it (harmless).

---

### 11. `TC335_GiftBoxSender.sql`
**Level & profession achievement rewards.** *(StygianTheBest, ported by
Iceymidgit.)*

Creates **"Styx"** (entry **601018**) as the in-game mail sender, plus **Level
10–80 Gift Box** items (**60001–60008**) that pay out scaling gold (10g → 100g)
when opened. The core auto-mails the matching box when a player earns each level
achievement, and also mails fishing/cooking gifts — all via the **native
`achievement_reward` table** (no module/recompile needed).

Port fixes: `creature_template` translated to TC columns; `achievement_reward`
column names updated to TC (`ID`/`ItemID`/`Body`/…); `item_loot_template` rows
rewritten for TC's 9-column layout.

> The Level 80 box (item 60008) exists, but the original wired achievement
> triggers only for levels 10–70. Add a trigger if you want level 80 to mail too.

---

### 12. `TC335_SilithusCamp.sql`
**Decorative Silithus fishing camp.** *(StygianTheBest, ported by Iceymidgit.)*

**"John the Fisherman"** (entry **601005**, GUID **1994210**) walks a waypoint
path, sells fishing books, and speaks three flavour lines, accompanied by camp
props — fishing chair, fish schools, forge, tents (gameobject GUIDs **500467,
500469, 500694, 500802, 500927**) — and two extra camp NPCs (**601030/601031**).

The dead `db_script_string` + `waypoint_scripts` chatter was re-expressed as
native **`creature_text` + SmartAI** (an out-of-combat timer says a random line).
Other port fixes: `InhabitType` removed, `AiName`→`AIName`,
`spawndist`→`wander_distance`, `creature_addon` `bytes1/bytes2` dropped.

This file **already includes the spawn** — no `.npc add` needed.

---

### 13. `TC335_Jukebox.sql`
**Gossip-driven music player.** *(Rochet2 / StygianTheBest, ported by
Iceymidgit.)*

A **SmartAI** NPC: pick a track from its gossip menu and it plays that sound for
you (SmartAI action 4 = play sound — fully native, no core script). Contains
**628 song scripts** with **624 play-sound actions** across **55 menus**.

**Use:** `.npc add <entry>` (see the file header for the entry).

---

### 14. Price and vendor tweaks

Three small, fully TC-compatible files that only edit `item_template`
buy/sell prices or vendor stock:

- **`TC335_FishingPriceMods.sql`** — fished-goods price changes.
- **`TC335_ItemPricingTemplate.sql`** — miscellaneous item price changes.
- **`TC335_EtherealSoulTraderMods.sql`** — Ethereal Soul-Trader vendor inventory +
  price tweaks.

These are safe to import as-is and have no spawns or scripts.

---

# Credits

This pack ports and adapts existing community content to TrinityCore 3.3.5.
All original authorship belongs to the people below.

- **StygianTheBest** — original AzerothCore-Content pack, the source of most
  modules here (starter heirlooms, teleporter destinations, vendors, critter,
  trainer template, tome of flying, gift box sender, Silithus camp, price mods).
  Original project: AzerothCore-Content.
- **Rochet2** — original Portal Master and Jukebox concepts.
- **Iceymidgit** — TrinityCore 3.3.5 ports, schema fixes, the original
  starter-kit quests, and testing.

Designed for use alongside **trickerer's NPCBots** mod
(https://github.com/trickerer/Trinity-Bots) where relevant.

## Licensing note
Because this repository is derived from existing community content, licensing
follows the original authors' terms. If you intend to redistribute, check the
upstream projects' licenses first. The newly-authored starter-kit files may be
used freely with attribution.

