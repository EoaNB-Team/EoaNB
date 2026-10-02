# Generates the British 1854-1857 opening branch (shared focuses, localisation, tree include).
# Run from the repository root:  pwsh tools/gen_britain_1854.ps1
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
. "$PSScriptRoot/lib_focus_gen.ps1"
Reset-Focuses

$POL = 'FOCUS_FILTER_POLITICAL'; $IND = 'FOCUS_FILTER_INDUSTRY'; $MIL = 'FOCUS_FILTER_MILITARY'
function Flag($flag, $tt) { "custom_trigger_tooltip = {`n`ttooltip = $tt`n`thas_country_flag = $flag`n}" }

# ================================================================================================
# A. THE EASTERN WAR (x -27..-19, y 0..5)
# ================================================================================================
New-Focus -Id 'ENG_v54_the_eastern_question' -Icon 'GFX_Focus_crimean_war' -X -23 -Y 0 -Cost 5 -Filters $POL -Ai 90 `
  -Name 'The Eastern Question' `
  -Desc 'Russian troops are in the Principalities and the Ottoman fleet has been burnt at Sinope. Lord Aberdeen wants peace, Palmerston and Russell want firmness, and The Times wants war. The road to India runs through Constantinople, or so every Englishman has been taught.' `
  -Reward @'
add_political_power = 25
country_event = { id = v54_gbr.50 }
'@

New-Focus -Id 'ENG_v54_for_the_sultan' -Icon 'GFX_Focus_Army_Victorian_Traditional' -X -26 -Y 1 -Cost 8 -Filters $POL -Hist -Ai 80 `
  -Pre @('ENG_v54_the_eastern_question') -Mutex @('ENG_v54_the_vienna_notes','ENG_v54_the_peace_party','ENG_v54_an_understanding_with_the_tsar') `
  -Available (Flag 'v54_gbr_stance_war' 'v54_tt_gbr_stance_war') `
  -Name 'For the Sultan' `
  -Desc 'Britain stands with the Ottoman Empire. The government declares war, the fleet is sent to the Baltic and the Black Sea, and a small army embarks for Turkey. Few in London know where Sevastopol is, and fewer still what the war will cost.' `
  -Reward @'
add_war_support = 0.03
add_political_power = 25
country_event = { id = v54_gbr.51 }
'@

New-Focus -Id 'ENG_v54_the_vienna_notes' -Icon 'GFX_focus_AUS_diplomatic_effort' -X -24 -Y 1 -Cost 8 -Filters $POL -Ai 30 `
  -Pre @('ENG_v54_the_eastern_question') -Mutex @('ENG_v54_for_the_sultan','ENG_v54_the_peace_party','ENG_v54_an_understanding_with_the_tsar') `
  -Available (Flag 'v54_gbr_stance_mediation' 'v54_tt_gbr_stance_mediation') `
  -Name 'The Vienna Notes' `
  -Desc 'Clarendon and the Austrian chancery draft note after note, each a little less offensive to the Tsar and a little less acceptable to the Sultan. Britain will not fight until every phrase has been tried, and the radical press says that the phrases are all that the government has.' `
  -Reward @'
add_political_power = 50
add_to_variable = { prestige_score = 2 }
'@

New-Focus -Id 'ENG_v54_the_peace_party' -Icon 'GFX_focus_eng_global_defense' -X -22 -Y 1 -Cost 8 -Filters $POL -Ai 15 `
  -Pre @('ENG_v54_the_eastern_question') -Mutex @('ENG_v54_for_the_sultan','ENG_v54_the_vienna_notes','ENG_v54_an_understanding_with_the_tsar') `
  -Available (Flag 'v54_gbr_stance_neutral' 'v54_tt_gbr_stance_neutral') `
  -Name 'The Peace Party' `
  -Desc 'Cobden and Bright speak for the Manchester school: trade, not war, is the business of England, and the Turk is not worth a single English life. The government agrees, for the moment, and the Tsar is not displeased.' `
  -Reward @'
add_stability = 0.02
add_political_power = 25
'@

New-Focus -Id 'ENG_v54_an_understanding_with_the_tsar' -Icon 'GFX_Focus_FRA_diplo_alexander_II' -X -20 -Y 1 -Cost 8 -Filters $POL -Ai 10 `
  -Pre @('ENG_v54_the_eastern_question') -Mutex @('ENG_v54_for_the_sultan','ENG_v54_the_vienna_notes','ENG_v54_the_peace_party') `
  -Available (Flag 'v54_gbr_stance_russia' 'v54_tt_gbr_stance_russia') `
  -Name 'An Understanding with the Tsar' `
  -Desc 'Some in the Cabinet remember that in 1844 Nicholas himself spoke to Aberdeen of the sick man of Europe and of what should happen to his estate. An agreement with Russia might give Britain Egypt and Crete and spare the Treasury a war.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_gbr_russian_understanding
'@

New-Focus -Id 'ENG_v54_the_expeditionary_force' -Icon 'GFX_focus_ENG_military_reforms' -X -26 -Y 2 -Cost 10 -Filters $MIL -Hist -Ai 80 `
  -Pre @('ENG_v54_for_the_sultan') `
  -Available "date > 1854.3.15" `
  -Name 'The Expeditionary Force' `
  -Desc 'Lord Raglan, who has not commanded in the field since Waterloo, takes a small army to Turkey. The Guards, the Highland brigade and the Light Division are good troops, the Commissariat is not, and no one has estimated how many men a siege will need.' `
  -Reward @'
country_event = { id = v54_gbr.54 }
'@

New-Focus -Id 'ENG_v54_the_baltic_fleet' -Icon 'GFX_Focus_Victorian_Line_Ship' -X -24 -Y 2 -Cost 10 -Filters $MIL -Ai 60 `
  -Pre @('ENG_v54_for_the_sultan') `
  -Name 'The Baltic Fleet' `
  -Desc 'Sir Charles Napier takes the finest fleet Britain has assembled since the Napoleonic wars into the Baltic. Its steam battleships are a wonder, its admiral''s temper is not, and Kronstadt turns out to be better defended than anyone had said.' `
  -Reward @'
add_ideas = ENG_v54_idea_baltic_fleet
country_event = { id = v54_gbr.52 }
'@

New-Focus -Id 'ENG_v54_the_winter_before_sevastopol' -Icon 'GFX_Focus_improved_communications' -X -22 -Y 2 -Cost 10 -Filters $MIL -Hist -Ai 60 `
  -Pre @('ENG_v54_the_expeditionary_force|ENG_v54_for_the_sultan') `
  -Available "date > 1854.11.1`nhas_global_flag = v54_crimean_war_active" `
  -Name 'The Winter before Sevastopol' `
  -Desc 'Cholera, frost and bad supply are killing the army faster than the Russians. Russell''s dispatches in The Times tell England what the ministers had hoped would remain unsaid, and the House asks why the Commissariat has no boots, no huts and no hospital.' `
  -Reward @'
country_event = { id = v54_gbr.56 }
'@

New-Focus -Id 'ENG_v54_florence_nightingale' -Icon 'GFX_Focus_military_nurse' -X -26 -Y 3 -Cost 8 -Filters $POL -Hist -Ai 60 `
  -Pre @('ENG_v54_the_winter_before_sevastopol') `
  -Available "date > 1854.10.15" `
  -Name 'Florence Nightingale' `
  -Desc 'Sidney Herbert asks a woman of thirty-four, the superintendent of a London nursing home, to take nurses to Scutari. She finds a hospital in which more men die of fever than of wounds, and she sets about making the army''s doctors, officers and clerks understand it.' `
  -Reward @'
add_ideas = ENG_v54_idea_nightingale
add_to_variable = { prestige_score = 2 }
'@

New-Focus -Id 'ENG_v54_the_land_transport_corps' -Icon 'GFX_Focus_Telegraph_Lines' -X -24 -Y 3 -Cost 8 -Filters $MIL -Ai 50 `
  -Pre @('ENG_v54_the_winter_before_sevastopol') `
  -Available "date > 1855.1.1" `
  -Name 'The Land Transport Corps' `
  -Desc 'The army has no transport of its own and the Commissariat cannot move a ton of biscuit from Balaclava to the trenches. A new Land Transport Corps is raised, a railway is laid up from the harbour, and the men are, at last, fed.' `
  -Reward @'
add_ideas = ENG_v54_idea_land_transport
'@

New-Focus -Id 'ENG_v54_the_roebuck_motion' -Icon 'GFX_goal_focus_palmerston_resignation' -X -22 -Y 3 -Cost 8 -Filters $POL -Hist -Ai 50 `
  -Pre @('ENG_v54_the_winter_before_sevastopol') `
  -Available "date > 1855.1.1`nhas_global_flag = v54_crimean_war_active" `
  -Name 'The Sebastopol Committee' `
  -Desc 'Roebuck moves for a committee to inquire into the state of the army before Sevastopol. The government that has sent the army and failed to supply it cannot survive a division, and the question is who will govern in its place.' `
  -Reward @'
country_event = { id = v54_gbr.57 }
'@

New-Focus -Id 'ENG_v54_the_war_office' -Icon 'GFX_Focus_Government_Reform_Administration' -X -24 -Y 4 -Cost 10 -Filters $MIL -Hist -Ai 60 `
  -Pre @('ENG_v54_florence_nightingale|ENG_v54_the_land_transport_corps|ENG_v54_the_roebuck_motion') `
  -Name 'Reform of the War Department' `
  -Desc 'The Secretary at War, the Ordnance, the Commissariat and the Horse Guards each control a piece of the army and nobody controls the whole. A single Secretary of State for War is appointed, the Commissariat is moved under him, and the first lessons are learned.' `
  -Reward @'
if = { limit = { has_idea = ENG_v54_idea_horse_guards } remove_ideas = ENG_v54_idea_horse_guards }
if = { limit = { has_idea = ENG_v54_idea_crimean_winter } remove_ideas = ENG_v54_idea_crimean_winter }
if = { limit = { has_idea = ENG_v54_idea_army_scandal } remove_ideas = ENG_v54_idea_army_scandal }
add_political_power = 50
add_stability = 0.01
'@

New-Focus -Id 'ENG_v54_the_declaration_of_paris' -Icon 'GFX_Focus_berlin_conference' -X -24 -Y 5 -Cost 10 -Filters $POL -Hist -Ai 70 `
  -Pre @('ENG_v54_the_war_office|ENG_v54_the_vienna_notes|ENG_v54_the_peace_party') `
  -Available "has_global_flag = v54_crimean_war_ended" `
  -Name 'The Declaration of Paris' `
  -Desc 'At Paris the great powers adopt rules for war at sea: privateering is abolished, a neutral flag covers enemy goods and blockades must be effective. The Admiralty regards the second clause as a gift to the enemy, the Foreign Office as a price worth paying for the other three.' `
  -Reward @'
country_event = { id = v54_gbr.58 }
'@

# ================================================================================================
# B. PARLIAMENT AND THE CROWN (x -17..-9, y 0..3)
# ================================================================================================
New-Focus -Id 'ENG_v54_the_aberdeen_coalition' -Icon 'GFX_goal_focus_palmerston_compromise' -X -13 -Y 0 -Cost 5 -Filters $POL -Hist -Ai 90 `
  -Name 'The Aberdeen Coalition' `
  -Desc 'Lord Aberdeen governs with a coalition of Peelites and Whigs, with Gladstone at the Exchequer, Russell at the Council and Palmerston at the Home Office. It is the ablest cabinet of the century and the least united, and the Eastern crisis is the test it was not built for.' `
  -Reward @'
add_ideas = ENG_v54_idea_coalition_cabinet
add_political_power = 50
'@

New-Focus -Id 'ENG_v54_gladstones_budget' -Icon 'GFX_Focus_Army_Budget' -X -16 -Y 1 -Cost 8 -Filters $IND -Hist -Ai 70 `
  -Pre @('ENG_v54_the_aberdeen_coalition') `
  -Name 'Gladstone''s Budget' `
  -Desc 'The Chancellor believes that wars should be paid for out of taxation, not borrowing, and that every shilling the government spends should be accounted for. The war budget of 1854 doubles the income tax and the Chancellor does not apologise.' `
  -Reward @'
country_event = { id = v54_gbr.61 }
'@

New-Focus -Id 'ENG_v54_northcote_trevelyan' -Icon 'GFX_focus_generic_improve_the_administration' -X -12 -Y 1 -Cost 8 -Filters $POL -Hist -Ai 50 `
  -Pre @('ENG_v54_the_aberdeen_coalition') `
  -Available "date > 1854.2.1" `
  -Name 'The Northcote-Trevelyan Report' `
  -Desc 'Two senior officials propose that the civil service be recruited by open examination and promoted on merit, not by patronage. The proposal alarms every minister who has a nephew to place, and it is the first step toward an administration that works.' `
  -Reward @'
country_event = { id = v54_gbr.63 }
'@

New-Focus -Id 'ENG_v54_russells_reform_bill' -Icon 'GFX_focus_election_overlay_blue_1' -X -14 -Y 1 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('ENG_v54_the_aberdeen_coalition') `
  -Available "date < 1854.9.1" `
  -Name 'Russell''s Reform Bill' `
  -Desc 'Lord John Russell, the author of the Reform Act of 1832, brings in a bill to extend the franchise and to redistribute seats. The war has made it unpopular in the House, and the Prime Minister is half relieved at the prospect of its withdrawal.' `
  -Reward @'
country_event = { id = v54_gbr.60 }
'@

New-Focus -Id 'ENG_v54_the_press_and_public_opinion' -Icon 'GFX_Focus_Newspaper_Tax' -X -10 -Y 1 -Cost 8 -Filters $POL -Ai 40 `
  -Pre @('ENG_v54_the_aberdeen_coalition') `
  -Name 'The Fourth Estate' `
  -Desc 'The stamp duty on newspapers has been reduced and The Times sells forty thousand copies a day. Delane''s leaders are read in the Cabinet, and his correspondents tell the country more of the war than the War Office knows.' `
  -Reward @'
add_ideas = ENG_v54_idea_public_opinion
'@

New-Focus -Id 'ENG_v54_the_radical_opposition' -Icon 'GFX_Focus_Anti_Liberalism' -X -16 -Y 2 -Cost 8 -Filters $POL -Ai 25 `
  -Pre @('ENG_v54_the_aberdeen_coalition') `
  -Name 'The Manchester School' `
  -Desc 'Cobden and Bright oppose the war from the benches below the gangway, with petitions from Lancashire and speeches that are heard in silence and read with respect. They are out of tune with the country and in tune with the ledger.' `
  -Reward @'
add_ideas = ENG_v54_idea_manchester_school
add_political_power = 25
'@

New-Focus -Id 'ENG_v54_the_irish_question' -Icon 'GFX_goal_focus_develop_ireland' -X -14 -Y 2 -Cost 8 -Filters $POL -Ai 40 `
  -Pre @('ENG_v54_the_aberdeen_coalition') `
  -Name 'Ireland after the Famine' `
  -Desc 'A million Irish have died or emigrated, the Tenant League demands fair rents and tenant right, and the Irish Brigade in the Commons holds the balance between the parties. Whoever governs must decide whether the land question can be left to the landlords.' `
  -Reward @'
country_event = { id = v54_gbr.62 }
'@

New-Focus -Id 'ENG_v54_the_palmerston_ministry' -Icon 'GFX_goal_focus_palmerston_government' -X -12 -Y 2 -Cost 8 -Filters $POL -Hist -Ai 60 `
  -Pre @('ENG_v54_the_roebuck_motion') `
  -Available (Flag 'v54_gbr_pm_palmerston' 'v54_tt_gbr_pm_palmerston') `
  -Name 'The Palmerston Ministry' `
  -Desc 'The old Viscount, seventy years old and the most popular man in England, forms a ministry to win the war. He believes that Britain has a mission to defend liberty abroad, with a fleet and with words, and that the people are behind him.' `
  -Reward @'
add_ideas = ENG_v54_idea_palmerston_ministry
add_political_power = 50
'@

New-Focus -Id 'ENG_v54_prince_albert' -Icon 'GFX_Focus_SAX_Albert' -X -10 -Y 2 -Cost 8 -Filters $POL -Ai 40 `
  -Pre @('ENG_v54_the_aberdeen_coalition') `
  -Name 'Prince Albert' `
  -Desc 'The Prince Consort reads every dispatch, writes memoranda on everything and presses for science, for education and for the improvement of the working classes. The press says that he meddles in foreign policy, and the ministers learn that he is usually right.' `
  -Reward @'
add_ideas = ENG_v54_idea_prince_albert
'@

New-Focus -Id 'ENG_v54_a_prussian_marriage' -Icon 'GFX_Focus_Royal_Marriage' -X -12 -Y 3 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('ENG_v54_prince_albert') `
  -Available "date > 1855.9.1" `
  -Name 'The Princess Royal''s Engagement' `
  -Desc 'Prince Friedrich Wilhelm of Prussia has come to Balmoral and, in a walk on the heather, proposed to the Princess Royal. Victoria and Albert hope that the match will bind Prussia to Britain and make the liberal cause in Germany the cause of the dynasty.' `
  -Reward @'
country_event = { id = v54_gbr.65 }
'@

# ================================================================================================
# C. THE WORKSHOP OF THE WORLD (x -8..-2, y 0..3)
# ================================================================================================
New-Focus -Id 'ENG_v54_workshop_of_the_world' -Icon 'GFX_Focus_banks2' -X -5 -Y 0 -Cost 5 -Filters $IND -Ai 90 `
  -Name 'The Workshop of the World' `
  -Desc 'Britain produces more coal, iron, cotton cloth and ships than the rest of Europe together. The Exhibition of 1851 showed it to the world, and the Crimean war now tests whether the workshop can also supply an army.' `
  -Reward @'
add_political_power = 25
'@

New-Focus -Id 'ENG_v54_free_trade' -Icon 'GFX_Focus_attract_british_goods' -X -8 -Y 1 -Cost 8 -Filters $IND -Hist -Ai 70 `
  -Pre @('ENG_v54_workshop_of_the_world') `
  -Name 'Free Trade' `
  -Desc 'The Corn Laws were repealed in 1846 and the Navigation Acts in 1849, and the tariff has been reduced to a handful of revenue duties. Free trade is no longer a policy but a creed, and the Chancellor is its high priest.' `
  -Reward @'
add_ideas = ENG_v54_idea_free_trade
'@

New-Focus -Id 'ENG_v54_railways_of_the_empire' -Icon 'GFX_Focus_Roads_Canals_Investment' -X -4 -Y 1 -Cost 10 -Filters $IND -Hist -Ai 60 `
  -Pre @('ENG_v54_workshop_of_the_world') `
  -Name 'The Railway Network' `
  -Desc 'Ten thousand miles of railway have been laid in twenty years, and the network is nearly complete. The companies amalgamate, the Railway Clearing House settles their accounts and the first lines are being built in India, Canada and Australia.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = transport_tech }
add_political_power = 25
'@

New-Focus -Id 'ENG_v54_the_telegraph_in_war' -Icon 'GFX_Focus_telegraph' -X -8 -Y 2 -Cost 8 -Filters $IND -Hist -Ai 50 `
  -Pre @('ENG_v54_free_trade') `
  -Name 'The Telegraph in the Crimea' `
  -Desc 'A cable is laid across the Black Sea and Raglan''s headquarters are in touch with Downing Street. For the first time ministers can give orders to a general in the field, and the general can answer them the same day.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = electronics_devices_tech }
'@

New-Focus -Id 'ENG_v54_the_war_budget' -Icon 'GFX_Focus_Bankruptcy' -X -4 -Y 2 -Cost 8 -Filters $IND -Ai 40 `
  -Pre @('ENG_v54_railways_of_the_empire|ENG_v54_free_trade') `
  -Available "has_global_flag = v54_crimean_war_active" `
  -Name 'Paying for the War' `
  -Desc 'The income tax is doubled, the National Debt is increased by loans and the Bank of England is asked to discount more paper than it likes. The Chancellor reckons that Britain can pay for a war of a few years without ruin, and the war is lasting longer than a few years.' `
  -Reward @'
set_temp_variable = { loans_amount = 6 }
take_loan_effect = yes
add_stability = -0.01
'@

New-Focus -Id 'ENG_v54_the_shipyards' -Icon 'GFX_goal_generic_construct_naval_dockyard' -X -6 -Y 3 -Cost 10 -Filters $IND -Ai 50 `
  -Pre @('ENG_v54_the_telegraph_in_war|ENG_v54_the_war_budget') `
  -Name 'The Clyde and the Thames' `
  -Desc 'The yards of the Clyde, the Tyne and the Thames build ships for the Navy and for every merchant fleet in the world. Iron hulls, screw propellers and compound engines are tried and adopted faster than the Admiralty can write specifications.' `
  -Reward @'
add_ideas = ENG_v54_idea_shipyards
'@

New-Focus -Id 'ENG_v54_limited_liability' -Icon 'GFX_Focus_banks' -X -2 -Y 3 -Cost 8 -Filters $IND -Hist -Ai 50 `
  -Pre @('ENG_v54_the_war_budget|ENG_v54_railways_of_the_empire') `
  -Available "date > 1855.6.1" `
  -Name 'Limited Liability' `
  -Desc 'Parliament allows companies to limit the liability of their shareholders to the capital they have subscribed. Investors who had stayed away from risk may now take part, and the City discovers a new way of raising capital.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = economics_tech }
add_ideas = ENG_v54_idea_limited_liability
'@

New-Focus -Id 'ENG_v54_coal_and_iron' -Icon 'GFX_Focus_coal_mines' -X -8 -Y 3 -Cost 8 -Filters $IND -Ai 40 `
  -Pre @('ENG_v54_free_trade') `
  -Name 'Coal and Iron' `
  -Desc 'The pits of Durham, South Wales and Lancashire, and the ironworks of Staffordshire and Clydeside, produce half the world''s coal and iron. Bessemer''s converter is being tried, and the price of steel is about to fall.' `
  -Reward @'
add_ideas = ENG_v54_idea_coal_and_iron
'@

# ================================================================================================
# D. THE ARMY AND THE FLEET (x -27..-19, y 8..11)
# ================================================================================================
New-Focus -Id 'ENG_v54_the_army_in_1854' -Icon 'GFX_Focus_Army_Victorian_Traditional' -X -23 -Y 8 -Cost 5 -Filters $MIL -Ai 90 `
  -Name 'The Army in 1854' `
  -Desc 'The British Army is a small, long-service, volunteer force: a few brilliant regiments, many bad ones, and an officer corps in which rank is bought and promotion is a matter of purse and connection. It has not fought a European enemy since 1815.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_gbr_army_focus_started
'@

New-Focus -Id 'ENG_v54_the_enfield_rifle' -Icon 'GFX_Focus_Weapon_Gun_1_WW1' -X -26 -Y 9 -Cost 10 -Filters $MIL -Hist -Ai 60 `
  -Pre @('ENG_v54_the_army_in_1854') `
  -Name 'The Enfield Rifle' `
  -Desc 'The Pattern 1853 Enfield rifle-musket takes the Minié bullet and hits a man at six hundred yards. The infantry will be re-armed at the Royal Small Arms Factory, and the East India Company will order its own Enfields for the sepoy army.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = infantry_weapons }
set_country_flag = v54_gbr_enfield
'@

New-Focus -Id 'ENG_v54_horse_guards' -Icon 'GFX_Focus_Army_Reactionary' -X -24 -Y 9 -Cost 8 -Filters $MIL -Ai 20 `
  -Pre @('ENG_v54_the_army_in_1854') `
  -Name 'The Horse Guards' `
  -Desc 'The Commander-in-Chief, Lord Hardinge, and the Horse Guards control promotion and discipline. They are honest, old-fashioned and suspicious of reform, and they have the Queen''s ear and the Duke of Cambridge''s sympathy.' `
  -Reward @'
add_ideas = ENG_v54_idea_horse_guards
add_stability = 0.01
'@

New-Focus -Id 'ENG_v54_purchase_of_commissions' -Icon 'GFX_focus_ENG_military_reforms' -X -22 -Y 9 -Cost 8 -Filters $MIL -Hist -Ai 40 `
  -Pre @('ENG_v54_the_army_in_1854') -Mutex @('ENG_v54_abolish_purchase') `
  -Name 'The Purchase System' `
  -Desc 'Commissions in the cavalry and infantry are bought and sold at regulated prices. The system keeps the army officered by gentlemen who have a stake in the country and, its critics say, by men who have never studied their profession.' `
  -Reward @'
add_stability = 0.01
set_country_flag = v54_gbr_purchase_kept
'@

New-Focus -Id 'ENG_v54_abolish_purchase' -Icon 'GFX_Focus_Government_Navy_Reform' -X -20 -Y 9 -Cost 8 -Filters $MIL -Ai 10 `
  -Pre @('ENG_v54_the_army_in_1854') -Mutex @('ENG_v54_purchase_of_commissions') `
  -Name 'Abolish Purchase' `
  -Desc 'A group of reformers argues that commissions should be given for merit, and that the Crimea has shown what the purchase system costs. The aristocracy sees an attack on its position, and the Treasury sees a very large compensation bill.' `
  -Reward @'
add_stability = -0.02
add_ideas = ENG_v54_idea_merit_commissions
set_country_flag = v54_gbr_purchase_abolished
'@

New-Focus -Id 'ENG_v54_the_steam_navy' -Icon 'GFX_Focus_Victorian_Ironclad' -X -26 -Y 10 -Cost 10 -Filters $MIL -Hist -Ai 60 `
  -Pre @('ENG_v54_the_army_in_1854') `
  -Name 'The Steam Navy' `
  -Desc 'The Royal Navy has converted its line-of-battle ships to steam, and the screw battleship Agamemnon is the finest warship afloat. The French are building their own, and the Admiralty is determined not to be caught napping.' `
  -Reward @'
add_ideas = ENG_v54_idea_steam_navy
'@

New-Focus -Id 'ENG_v54_gunboats_and_mortars' -Icon 'GFX_Focus_Victorian_Gunboat' -X -24 -Y 10 -Cost 8 -Filters $MIL -Ai 40 `
  -Pre @('ENG_v54_the_steam_navy|ENG_v54_the_baltic_fleet') `
  -Name 'Gunboats and Mortar Vessels' `
  -Desc 'The Baltic campaign shows that the Navy needs shallow-draught gunboats and mortar vessels to attack coastal fortresses. A hundred are ordered within months, built by every yard that has a slipway.' `
  -Reward @'
add_ideas = ENG_v54_idea_gunboats
'@

New-Focus -Id 'ENG_v54_armstrong_and_whitworth' -Icon 'GFX_Focus_Army_Generic_Imperial_Army' -X -22 -Y 10 -Cost 10 -Filters $MIL -Hist -Ai 50 `
  -Pre @('ENG_v54_the_enfield_rifle') `
  -Available "date > 1855.6.1" `
  -Name 'Armstrong and Whitworth' `
  -Desc 'William Armstrong, a Newcastle lawyer and hydraulic engineer, offers the War Office a breech-loading rifled gun of unheard-of accuracy, and Joseph Whitworth a rifle of his own design. The ordnance board is divided, and the army learns that the arms trade has rules of its own.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = artillery }
'@

New-Focus -Id 'ENG_v54_the_militia' -Icon 'GFX_Focus_conscription' -X -20 -Y 10 -Cost 8 -Filters $MIL -Ai 40 `
  -Pre @('ENG_v54_the_army_in_1854') `
  -Name 'The Militia' `
  -Desc 'The Militia Act of 1852 revived the old county militia as a reserve against invasion. With the army abroad it is embodied and its battalions are sent to garrison the fortresses, and some of its best men are persuaded to enlist in the line.' `
  -Reward @'
add_manpower = 10000
add_war_support = 0.01
'@

New-Focus -Id 'ENG_v54_the_staff_college' -Icon 'GFX_Focus_Army_Staff' -X -24 -Y 11 -Cost 8 -Filters $MIL -Ai 30 `
  -Pre @('ENG_v54_the_war_office|ENG_v54_abolish_purchase') `
  -Name 'The Staff College' `
  -Desc 'Sandhurst and the Staff College at Camberley are to teach the sciences of war to the officers who will conduct the next one. The first graduates will serve in the Crimea and the next in the Mutiny.' `
  -Reward @'
add_ideas = ENG_v54_idea_staff_college
'@

# ================================================================================================
# E. INDIA AND THE EMPIRE (x -17..-9, y 8..11)
# ================================================================================================
New-Focus -Id 'ENG_v54_john_company_india' -Icon 'GFX_Focus_Continent_India' -X -13 -Y 8 -Cost 5 -Filters $POL -Ai 90 `
  -Name 'John Company''s India' `
  -Desc 'The East India Company rules two hundred million people with a few thousand British officials and a Bengal army of two hundred thousand native soldiers. Lord Dalhousie, the Governor-General, has annexed the Punjab, Pegu, Satara, Nagpur and Jhansi, and the Company''s charter is renewed every twenty years.' `
  -Reward @'
add_political_power = 25
if = {
	limit = { NOT = { has_variable = v54_india_unrest } }
	set_variable = { v54_india_unrest = 20 }
}
'@

New-Focus -Id 'ENG_v54_the_doctrine_of_lapse' -Icon 'GFX_Focus_Break_Treaty' -X -16 -Y 9 -Cost 8 -Filters $POL -Hist -Ai 50 `
  -Pre @('ENG_v54_john_company_india') `
  -Name 'The Doctrine of Lapse' `
  -Desc 'When a native prince dies without a natural heir, his state lapses to the Company, and adopted sons do not inherit. The doctrine has brought Satara, Jhansi and Nagpur under British rule, and has made the princes of India wonder which of them is next.' `
  -Reward @'
country_event = { id = v54_gbr.70 }
'@

New-Focus -Id 'ENG_v54_the_oudh_question' -Icon 'GFX_Focus_Army_Crush' -X -14 -Y 9 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('ENG_v54_the_doctrine_of_lapse|ENG_v54_john_company_india') `
  -Available "date > 1855.9.1" `
  -Name 'The Oudh Question' `
  -Desc 'The kingdom of Oudh, the Company''s oldest ally, is badly governed by a king who writes poetry and keeps a thousand dancers. Dalhousie wishes to annex it in the name of good government, and the Sepoys of Bengal, many of whom are Oudh Brahmins, are not consulted.' `
  -Reward @'
country_event = { id = v54_gbr.71 }
'@

New-Focus -Id 'ENG_v54_the_general_service_act' -Icon 'GFX_Focus_Mandatory_Conscription' -X -12 -Y 9 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('ENG_v54_john_company_india') `
  -Available "date > 1856.5.1" `
  -Name 'The General Service Enlistment Act' `
  -Desc 'Lord Canning wants new recruits for the Bengal army to serve wherever they are sent, including overseas. The sea is polluted for the high-caste Hindu, and the existing sepoys, who are not covered by the act, suspect that their turn will come.' `
  -Reward @'
country_event = { id = v54_gbr.72 }
'@

New-Focus -Id 'ENG_v54_the_enfield_cartridge' -Icon 'GFX_Focus_Weapon_Gun_1_WW1' -X -10 -Y 9 -Cost 8 -Filters $MIL -Hist -Ai 40 `
  -Pre @('ENG_v54_the_general_service_act|ENG_v54_the_enfield_rifle') `
  -Available "date > 1856.12.1" `
  -Name 'The Enfield Cartridge' `
  -Desc 'The new Enfield rifle needs a cartridge that must be bitten open, and the paper is greased with tallow. A rumour runs through the Bengal army that the grease is beef fat and pig fat, polluting Hindu and Muslim alike, and that the Company means to destroy the sepoys'' faith.' `
  -Reward @'
country_event = { id = v54_gbr.73 }
'@

New-Focus -Id 'ENG_v54_the_bengal_army' -Icon 'GFX_Focus_Army_Reformed' -X -16 -Y 10 -Cost 8 -Filters $MIL -Ai 40 `
  -Pre @('ENG_v54_john_company_india') `
  -Name 'The Bengal Army' `
  -Desc 'The sepoys of Bengal are largely high-caste Hindus from Oudh and Bihar, proud of their caste and their regiments, and separated from their British officers by language, religion and an increasing indifference. A wise commander would pay attention to what they say.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_gbr_bengal_army_studied
if = {
	limit = { has_variable = v54_india_unrest }
	add_to_variable = { v54_india_unrest = -3 }
	clamp_variable = { var = v54_india_unrest min = 0 max = 100 }
}
'@

New-Focus -Id 'ENG_v54_education_and_reform_in_india' -Icon 'GFX_focus_AFG_education_reform' -X -14 -Y 10 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('ENG_v54_john_company_india') `
  -Name 'Education and Reform in India' `
  -Desc 'Wood''s Education Despatch of 1854 plans universities at Calcutta, Bombay and Madras and a system of vernacular schools. The Widow Remarriage Act follows. The reformers believe that India will be remade by reason, and the orthodox believe that it is being remade by conquest.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = humanities_tech }
add_to_variable = { prestige_score = 2 }
if = {
	limit = { has_variable = v54_india_unrest }
	add_to_variable = { v54_india_unrest = 4 }
	clamp_variable = { var = v54_india_unrest min = 0 max = 100 }
}
'@

New-Focus -Id 'ENG_v54_burma_and_pegu' -Icon 'GFX_focus_attack_india' -X -12 -Y 10 -Cost 8 -Filters $POL -Ai 30 `
  -Pre @('ENG_v54_john_company_india') `
  -Name 'Burma and Pegu' `
  -Desc 'The second Burmese war of 1852 has given the Company the province of Pegu, with Rangoon, and cut Upper Burma off from the sea. The king at Ava will not make a treaty, and the Company is not in a hurry to oblige him.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_gbr_pegu
'@

New-Focus -Id 'ENG_v54_the_persian_question' -Icon 'GFX_Focus_Map_Persian_Gulf' -X -10 -Y 10 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('ENG_v54_john_company_india') `
  -Available "date > 1856.9.1" `
  -Name 'The Persian Question' `
  -Desc 'A Persian army has seized Herat, the key to Afghanistan and the gateway to India, in breach of a treaty with Britain. The Government of India sends an expedition to the Gulf, and the Foreign Office wonders whether the Shah is acting for himself or for St Petersburg.' `
  -Reward @'
country_event = { id = v54_gbr.74 }
'@

New-Focus -Id 'ENG_v54_the_arrow_incident' -Icon 'GFX_Focus_Agriculture_opium_burning' -X -14 -Y 11 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('ENG_v54_john_company_india|ENG_v54_the_persian_question') `
  -Available "date > 1856.10.1" `
  -Name 'The Arrow Incident' `
  -Desc 'Chinese officials board the lorcha Arrow at Canton, haul down her British flag and arrest her crew. Sir John Bowring and Admiral Seymour see an insult that demands redress, and the House of Commons will soon be asked whether it agrees.' `
  -Reward @'
country_event = { id = v54_gbr.75 }
'@

$ids = Write-FocusFiles 'britain' "# Victorian 1854-1900 project: British opening branch 1854-1857 (generated by tools/gen_britain_1854.ps1).`n# Included in the tree britain_focus by a marked block in common/national_focus/britain_1857_focus.txt.`n# Layout: x -27..-2, y 0..11, left of the upstream tree." 'British opening branch 1854-1857'
Patch-TreeInclude 'common/national_focus/britain_1857_focus.txt' $ids 'british 1854 opening branch'
"{0} focuses written; tree include patched" -f $ids.Count
