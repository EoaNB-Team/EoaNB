# Generates the French 1854-1857 opening branch (shared focuses, localisation, tree include).
# Run from the repository root:  pwsh tools/gen_france_1854.ps1
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
. "$PSScriptRoot/lib_focus_gen.ps1"
Reset-Focuses

$POL = 'FOCUS_FILTER_POLITICAL'; $IND = 'FOCUS_FILTER_INDUSTRY'; $MIL = 'FOCUS_FILTER_MILITARY'
function Flag($flag, $tt) { "custom_trigger_tooltip = {`n`ttooltip = $tt`n`thas_country_flag = $flag`n}" }
$AUTH = 'tooltip_side = FRA_BOP_Authoritarian_Emperor'; $PROG = 'tooltip_side = FRA_BOP_Progressive_Emperor'
function Bop($v, $side) { "add_power_balance_value = {`n`tid = FRA_Balance_of_Power_Napoleon`n`tvalue = $v`n`t$side`n}" }

# ================================================================================================
# A. THE EASTERN QUESTION AND THE WESTERN ALLIANCE (x -27..-19, y 0..5)
# ================================================================================================
New-Focus -Id 'FRA_v54_the_eastern_question' -Icon 'GFX_Focus_crimean_war' -X -23 -Y 0 -Cost 5 -Filters $POL -Ai 90 `
  -Name 'The Eastern Question' `
  -Desc 'France has championed Catholic rights in the Holy Land and now sees Russian pressure on the Sultan as a chance to break out of the isolation of 1815. Napoleon III needs success abroad, but a long war could cost him the finances and the army that his regime stands on.' `
  -Reward @'
add_political_power = 25
country_event = { id = v54_fra.50 }
'@

New-Focus -Id 'FRA_v54_the_alliance_with_britain' -Icon 'GFX_Focus_FRA_diplo_victoria' -X -26 -Y 1 -Cost 8 -Filters $POL -Hist -Ai 80 `
  -Pre @('FRA_v54_the_eastern_question') -Mutex @('FRA_v54_mediation_at_vienna','FRA_v54_neutrality_of_the_empire','FRA_v54_an_understanding_with_russia') `
  -Available (Flag 'v54_fra_stance_war' 'v54_tt_fra_stance_war') `
  -Name 'The Alliance with Britain' `
  -Desc 'The Emperor''s greatest diplomatic prize is within reach: an alliance with Britain, the power that destroyed his uncle. If the two nations fight side by side against Russia, the settlement of 1815 will have been broken by the powers that made it.' `
  -Reward @'
add_political_power = 25
add_war_support = 0.03
if = {
	limit = { country_exists = ENG }
	add_opinion_modifier = { target = ENG modifier = v54_om_crimean_comrades_in_arms }
	reverse_add_opinion_modifier = { target = ENG modifier = v54_om_crimean_comrades_in_arms }
}
country_event = { id = v54_fra.51 }
'@

New-Focus -Id 'FRA_v54_mediation_at_vienna' -Icon 'GFX_focus_AUS_diplomatic_effort' -X -24 -Y 1 -Cost 8 -Filters $POL -Ai 30 `
  -Pre @('FRA_v54_the_eastern_question') -Mutex @('FRA_v54_the_alliance_with_britain','FRA_v54_neutrality_of_the_empire','FRA_v54_an_understanding_with_russia') `
  -Available (Flag 'v54_fra_stance_mediation' 'v54_tt_fra_stance_mediation') `
  -Name 'Mediation at Vienna' `
  -Desc 'The Emperor lets it be known that France would prefer a settlement. His ministers prepare notes for the Vienna conference, and the Emperor keeps his army at home and his options open.' `
  -Reward @'
add_political_power = 50
add_to_variable = { prestige_score = 2 }
'@

New-Focus -Id 'FRA_v54_neutrality_of_the_empire' -Icon 'GFX_focus_AUS_defence_of_the_homeland' -X -22 -Y 1 -Cost 8 -Filters $POL -Ai 15 `
  -Pre @('FRA_v54_the_eastern_question') -Mutex @('FRA_v54_the_alliance_with_britain','FRA_v54_mediation_at_vienna','FRA_v54_an_understanding_with_russia') `
  -Available (Flag 'v54_fra_stance_neutral' 'v54_tt_fra_stance_neutral') `
  -Name 'The Empire Stands Aside' `
  -Desc 'The Emperor decides that France has no interest in the Danube worth a war. The army is saved for Algeria and the finances are saved for Paris, and the opposition says that the nephew has none of his uncle''s ambition.' `
  -Reward @'
add_stability = 0.02
add_political_power = 25
'@

New-Focus -Id 'FRA_v54_an_understanding_with_russia' -Icon 'GFX_Focus_FRA_diplo_alexander_II' -X -20 -Y 1 -Cost 8 -Filters $POL -Ai 10 `
  -Pre @('FRA_v54_the_eastern_question') -Mutex @('FRA_v54_the_alliance_with_britain','FRA_v54_mediation_at_vienna','FRA_v54_neutrality_of_the_empire') `
  -Available (Flag 'v54_fra_stance_russia' 'v54_tt_fra_stance_russia') `
  -Name 'An Understanding with Russia' `
  -Desc 'The Emperor sees in the Tsar a possible partner against the settlement of 1815: Russia can help to undo the Vienna treaties and France can help Russia in the East. London is alarmed, and so are the Orleanists.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_fra_russian_understanding
'@

New-Focus -Id 'FRA_v54_army_of_the_east' -Icon 'GFX_Focus_Army_General_Mobilization_Generic_1' -X -26 -Y 2 -Cost 10 -Filters $MIL -Hist -Ai 80 `
  -Pre @('FRA_v54_the_alliance_with_britain') `
  -Available "date > 1854.3.15" `
  -Name 'The Army of the East' `
  -Desc 'Saint-Arnaud''s divisions embark at Marseille for Gallipoli and Varna. The army has not fought a European war since 1815, its staff is improvised and its commissariat is untried, and every man in it believes that he is following the Emperor to glory.' `
  -Reward @'
country_event = { id = v54_fra.54 }
'@

New-Focus -Id 'FRA_v54_the_baltic_and_black_sea_fleets' -Icon 'GFX_Focus_FRA_imperial_fleet' -X -24 -Y 2 -Cost 10 -Filters $MIL -Ai 60 `
  -Pre @('FRA_v54_the_alliance_with_britain') `
  -Name 'The Baltic and Black Sea Fleets' `
  -Desc 'The French fleet sails with the British into the Baltic and the Black Sea. Its steam battleships are the equal of any in Europe, and the first campaign will show whether its officers and its dockyards are ready for a long war.' `
  -Reward @'
add_ideas = FRA_v54_idea_allied_fleets
'@

New-Focus -Id 'FRA_v54_reinforce_the_crimea' -Icon 'GFX_Focus_FRA_napoleonian_veteran' -X -22 -Y 2 -Cost 10 -Filters $MIL -Ai 60 `
  -Pre @('FRA_v54_army_of_the_east') `
  -Available "date > 1854.9.1`nhas_global_flag = v54_crimean_war_active" `
  -Name 'Reinforce the Crimea' `
  -Desc 'The siege of Sevastopol swallows men by the thousand. Saint-Arnaud is dead, Canrobert has been replaced by Pélissier, and every regiment in France is combed for drafts. The Emperor has promised victory and must pay for it.' `
  -Reward @'
add_manpower = 25000
add_war_support = 0.02
set_temp_variable = { money_to_gain = -1 }
add_money_with_tooltip_effect = yes
'@

New-Focus -Id 'FRA_v54_peace_feelers' -Icon 'GFX_Focus_FRA_biarritz_meeting' -X -24 -Y 3 -Cost 8 -Filters $POL -Hist -Ai 60 `
  -Pre @('FRA_v54_reinforce_the_crimea|FRA_v54_the_baltic_and_black_sea_fleets') `
  -Available "date > 1855.9.1`nhas_global_flag = v54_crimean_war_active" `
  -Name 'Peace Feelers' `
  -Desc 'Sevastopol has fallen, but the army is exhausted and the Emperor''s thoughts turn to a settlement that will give France its laurels without a further winter in the Crimea. Austria offers mediation and Britain wants the war to go on.' `
  -Reward @'
country_event = { id = v54_fra.57 }
'@

New-Focus -Id 'FRA_v54_the_congress_of_paris' -Icon 'GFX_goal_focus_prussia_paris_declaration' -X -24 -Y 4 -Cost 10 -Filters $POL -Hist -Ai 70 `
  -Pre @('FRA_v54_peace_feelers|FRA_v54_mediation_at_vienna|FRA_v54_neutrality_of_the_empire') `
  -Available "has_global_flag = v54_crimean_war_ended" `
  -Name 'The Congress of Paris' `
  -Desc 'Paris is the capital of Europe for six weeks. Walewski presides, the plenipotentiaries of seven powers sit round the table, and the French Emperor is for the first time the arbiter of the Continent. The question is what he will do with the position.' `
  -Reward @'
country_event = { id = v54_fra.58 }
'@

# ================================================================================================
# B. THE SECOND EMPIRE (x -17..-9, y 0..3)
# ================================================================================================
New-Focus -Id 'FRA_v54_the_second_empire' -Icon 'GFX_Focus_FRA_napoleon_III' -X -13 -Y 0 -Cost 5 -Filters $POL -Hist -Ai 90 `
  -Name 'The Second Empire' `
  -Desc 'Louis-Napoleon seized power on 2 December 1851 and was proclaimed Emperor a year later, confirmed by plebiscites with seven million votes. The Empire rests on the army, the Church, the peasants and the promise of prosperity, and it knows how little else it rests on.' `
  -Reward @'
add_political_power = 50
add_stability = 0.01
'@

New-Focus -Id 'FRA_v54_the_corps_legislatif' -Icon 'GFX_Focus_Assembly_Law' -X -16 -Y 1 -Cost 8 -Filters $POL -Ai 60 `
  -Pre @('FRA_v54_the_second_empire') `
  -Name 'The Corps Législatif' `
  -Desc 'The legislature is elected by universal male suffrage and has little else to recommend it. The prefects name the official candidates, the Corps Législatif votes the budget as a whole, and the Senate and the Council of State draft the laws.' `
  -Reward @'
add_ideas = FRA_v54_idea_official_candidates
'@

New-Focus -Id 'FRA_v54_press_and_censorship' -Icon 'GFX_Focus_Freedom_Press_controlled' -X -12 -Y 1 -Cost 8 -Filters $POL -Ai 50 `
  -Pre @('FRA_v54_the_second_empire') `
  -Name 'The Press Decree' `
  -Desc 'The decree of 1852 makes every newspaper depend on the government''s good will: a licence, a stamp duty and a system of warnings that ends in suspension. The press that survives is dull, loyal and rich in advertisements.' `
  -Reward @'
add_stability = 0.02
add_political_power = 25
add_power_balance_value = {
	id = FRA_Balance_of_Power_Napoleon
	value = 0.05
	tooltip_side = FRA_BOP_Authoritarian_Emperor
}
'@

New-Focus -Id 'FRA_v54_the_opposition_in_exile' -Icon 'GFX_Focus_FRA_bagne' -X -10 -Y 1 -Cost 8 -Filters $POL -Ai 40 `
  -Pre @('FRA_v54_the_second_empire') -Mutex @('FRA_v54_conciliate_the_opposition') `
  -Name 'Watch the Exiles' `
  -Desc 'Victor Hugo writes his satires from Jersey, Ledru-Rollin and Mazzini plot from London, and the Orleanists meet at Claremont. The police are told to watch every letter, and the Emperor remarks that conspirators are best kept in sight.' `
  -Reward @'
add_stability = 0.02
add_political_power = 25
add_power_balance_value = {
	id = FRA_Balance_of_Power_Napoleon
	value = 0.03
	tooltip_side = FRA_BOP_Authoritarian_Emperor
}
'@

New-Focus -Id 'FRA_v54_conciliate_the_opposition' -Icon 'GFX_Focus_FRA_general_amnesty' -X -8 -Y 1 -Cost 8 -Filters $POL -Ai 15 `
  -Pre @('FRA_v54_the_second_empire') -Mutex @('FRA_v54_the_opposition_in_exile') `
  -Name 'Conciliate the Opposition' `
  -Desc 'Amnesties are granted to those who will promise to behave, and a few of the exiled return. The Emperor reckons that a regime that is sure of itself can afford to forgive, and his police chiefs reckon the opposite.' `
  -Reward @'
add_political_power = 25
add_power_balance_value = {
	id = FRA_Balance_of_Power_Napoleon
	value = -0.05
	tooltip_side = FRA_BOP_Progressive_Emperor
}
'@

New-Focus -Id 'FRA_v54_the_church_and_the_empire' -Icon 'GFX_Focus_Catholism_Ally_Pope' -X -16 -Y 2 -Cost 8 -Filters $POL -Hist -Ai 60 `
  -Pre @('FRA_v54_the_corps_legislatif') `
  -Name 'The Church and the Empire' `
  -Desc 'The Catholic party made the Empire possible and expects a return: schools, charities and a French garrison in Rome. The Emperor gives what he can without alienating the Voltairean middle class, and the Empress, a devout Spaniard, encourages him.' `
  -Reward @'
add_ideas = FRA_v54_idea_church_and_empire
add_stability = 0.02
'@

New-Focus -Id 'FRA_v54_the_empress' -Icon 'GFX_Focus_FRA_eugenie' -X -14 -Y 2 -Cost 8 -Filters $POL -Ai 40 `
  -Pre @('FRA_v54_the_corps_legislatif|FRA_v54_press_and_censorship') `
  -Name 'The Empress Eugénie' `
  -Desc 'Eugénie de Montijo, whom the Emperor married in January 1853, is beautiful, pious and political. She sets the fashions of Europe, takes sides in the quarrels of the court and has opinions on the foreign policy of France.' `
  -Reward @'
add_political_power = 25
add_to_variable = { prestige_score = 2 }
set_country_flag = v54_fra_eugenie_influence
'@

New-Focus -Id 'FRA_v54_the_windsor_visit' -Icon 'GFX_Focus_FRA_diplo_victoria' -X -12 -Y 2 -Cost 8 -Filters $POL -Hist -Ai 50 `
  -Pre @('FRA_v54_the_empress|FRA_v54_the_alliance_with_britain') `
  -Available "date > 1855.3.15" `
  -Name 'The State Visit to Windsor' `
  -Desc 'The Emperor and Empress cross the Channel for a state visit to Queen Victoria, the first French sovereign to be received at Windsor in centuries. The Queen is charmed against her expectations, and the English newspapers print what Parisians wear.' `
  -Reward @'
country_event = { id = v54_fra.61 }
'@

New-Focus -Id 'FRA_v54_the_prince_imperial' -Icon 'GFX_Focus_FRA_crown_napoleon_iv' -X -10 -Y 2 -Cost 8 -Filters $POL -Hist -Ai 50 `
  -Pre @('FRA_v54_the_empress') `
  -Available "date > 1856.2.1" `
  -Name 'The Birth of the Prince Imperial' `
  -Desc 'After three years without an heir, the Empress gives birth to a son on the eve of the congress, and the dynasty has a future. The cannon of the Invalides fire a hundred and one salvoes, and every Bonapartist in France sleeps better.' `
  -Reward @'
country_event = { id = v54_fra.60 }
'@

New-Focus -Id 'FRA_v54_the_exposition_universelle' -Icon 'GFX_goal_focus_paris_revival' -X -15 -Y 3 -Cost 10 -Filters $POL -Hist -Ai 60 `
  -Pre @('FRA_v54_the_second_empire') `
  -Available "date > 1854.12.1" `
  -Name 'The Exposition Universelle' `
  -Desc 'Paris prepares to show the world what the Empire has made: a Palace of Industry on the Champs-Élysées, a gallery of fine arts, and a visit from the Queen of England. The Emperor wants the Exposition to outshine the Crystal Palace of 1851.' `
  -Reward @'
country_event = { id = v54_fra.62 }
'@

New-Focus -Id 'FRA_v54_the_official_tours' -Icon 'GFX_Focus_FRA_future_of_empire' -X -11 -Y 3 -Cost 8 -Filters $POL -Ai 40 `
  -Pre @('FRA_v54_the_church_and_the_empire|FRA_v54_the_empress') `
  -Name 'The Imperial Tours' `
  -Desc 'The Emperor travels the provinces to inspect works, bless railways and be seen. The prefects arrange the welcomes, the mayors compose the speeches, and the peasants of the Midi cheer the nephew of the man who gave them their land.' `
  -Reward @'
add_stability = 0.02
add_to_variable = { prestige_score = 2 }
'@

# ================================================================================================
# C. ECONOMY (x -8..-2, y 0..3)
# ================================================================================================
New-Focus -Id 'FRA_v54_the_imperial_economy' -Icon 'GFX_Focus_FRA_nap_economic_system' -X -5 -Y 0 -Cost 5 -Filters $IND -Ai 90 `
  -Name 'The Imperial Economy' `
  -Desc 'The Emperor, a Saint-Simonian by conviction, believes that railways, banks and public works will make the French rich and the Empire loved. Cheap credit, great projects and a stable currency are the programme, and the harvest is the only variable he cannot command.' `
  -Reward @'
add_political_power = 25
'@

New-Focus -Id 'FRA_v54_credit_mobilier' -Icon 'GFX_Focus_banks' -X -8 -Y 1 -Cost 8 -Filters $IND -Hist -Ai 70 `
  -Pre @('FRA_v54_the_imperial_economy') `
  -Name 'The Crédit Mobilier' `
  -Desc 'The Pereire brothers'' bank, founded in 1852 on the model of Saint-Simon''s dreams, collects the savings of small investors to finance railways, shipping and industry. Its shares rise every month, and so does the opposition of the Rothschilds.' `
  -Reward @'
add_ideas = FRA_v54_idea_credit_mobilier
add_tech_bonus = { bonus = 0.75 uses = 1 category = economics_tech }
'@

New-Focus -Id 'FRA_v54_the_railway_companies' -Icon 'GFX_Focus_Roads_Canals_Investment' -X -4 -Y 1 -Cost 10 -Filters $IND -Hist -Ai 70 `
  -Pre @('FRA_v54_the_imperial_economy') `
  -Name 'The Great Railway Companies' `
  -Desc 'The state encourages the many small companies to merge into six great networks, each with a guaranteed return and a monopoly of its region. The lines will reach every corner of France, and the shareholders will grow rich while they do it.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = transport_tech }
add_ideas = FRA_v54_idea_railway_companies
'@

New-Focus -Id 'FRA_v54_haussmanns_paris' -Icon 'GFX_Focus_FRA_paris_haussmann' -X -8 -Y 2 -Cost 10 -Filters $IND -Hist -Ai 60 `
  -Pre @('FRA_v54_credit_mobilier') `
  -Name 'Haussmann''s Paris' `
  -Desc 'Baron Haussmann, prefect of the Seine since 1853, is to tear open the medieval city: new boulevards, a new sewer system, parks, markets and a new Hôtel-Dieu. The Emperor wants a Paris that cannot be barricaded and that visitors will remember.' `
  -Reward @'
country_event = { id = v54_fra.63 }
'@

New-Focus -Id 'FRA_v54_the_free_trade_question' -Icon 'GFX_Focus_attract_british_goods' -X -4 -Y 2 -Cost 8 -Filters $IND -Ai 40 `
  -Pre @('FRA_v54_the_railway_companies|FRA_v54_the_imperial_economy') `
  -Name 'Tariffs or Free Trade?' `
  -Desc 'Michel Chevalier and the Saint-Simonians urge the Emperor to open French markets to British iron, coal and cloth. The manufacturers of the north and the Legislature say that it will ruin them. The decision may be the most important economic choice of the reign.' `
  -Reward @'
country_event = { id = v54_fra.66 }
'@

New-Focus -Id 'FRA_v54_the_suez_concession' -Icon 'GFX_Focus_Suez_Canal' -X -6 -Y 3 -Cost 10 -Filters $IND -Hist -Ai 50 `
  -Pre @('FRA_v54_the_free_trade_question|FRA_v54_haussmanns_paris') `
  -Available "date > 1854.11.1" `
  -Name 'The Suez Concession' `
  -Desc 'Ferdinand de Lesseps, a diplomat with a plan, has persuaded the Viceroy of Egypt, Said Pasha, to grant him a concession to dig a canal across the isthmus. The Emperor is willing to support him, and Palmerston is not.' `
  -Reward @'
country_event = { id = v54_fra.65 }
'@

New-Focus -Id 'FRA_v54_gold_and_credit' -Icon 'GFX_Focus_financial_westernisation' -X -2 -Y 3 -Cost 8 -Filters $IND -Ai 40 `
  -Pre @('FRA_v54_the_railway_companies') `
  -Name 'Gold and Credit' `
  -Desc 'The gold of California and Australia has flooded Europe, prices are rising and money is cheap. The Banque de France discounts more paper than ever before, and the Emperor is tempted to let the boom run.' `
  -Reward @'
set_temp_variable = { money_to_gain = 3 }
add_money_with_tooltip_effect = yes
add_stability = 0.01
'@

# ================================================================================================
# D. THE ARMY, THE FLEET AND THE COLONIES (x -27..-19, y 8..11)
# ================================================================================================
New-Focus -Id 'FRA_v54_the_army_of_the_empire' -Icon 'GFX_Focus_Army_Napoleonic' -X -23 -Y 8 -Cost 5 -Filters $MIL -Ai 90 `
  -Name 'The Army of the Empire' `
  -Desc 'The French army is the largest in Europe after Russia''s, a long-service force of veterans of Algeria, officers who follow the Napoleonic legend and generals who learned their trade against Arabs. Its commanders have never faced a modern enemy, and they do not suspect that they will.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_fra_army_focus_started
'@

New-Focus -Id 'FRA_v54_the_imperial_guard' -Icon 'GFX_focus_asa_imperial_guard' -X -26 -Y 9 -Cost 8 -Filters $MIL -Hist -Ai 60 `
  -Pre @('FRA_v54_the_army_of_the_empire') `
  -Name 'The Imperial Guard' `
  -Desc 'The Emperor re-forms the Imperial Guard of his uncle: grenadiers, voltigeurs, chasseurs and cavalry, picked from the line and paid better. The Guard is a glittering escort for the Emperor and an elite at the army''s centre, and its officers are close to the throne.' `
  -Reward @'
add_ideas = FRA_v54_idea_imperial_guard
'@

New-Focus -Id 'FRA_v54_the_rifled_musket' -Icon 'GFX_Focus_Weapon_Gun_1_WW1' -X -24 -Y 9 -Cost 10 -Filters $MIL -Hist -Ai 60 `
  -Pre @('FRA_v54_the_army_of_the_empire') `
  -Name 'The Rifled Musket' `
  -Desc 'The Minié bullet makes the old musket a rifle, and the chasseurs de Vincennes are the first to carry it. Every regiment wants the new weapon, and the arsenals at Saint-Étienne and Tulle are asked to supply it.' `
  -Reward @'
add_tech_bonus = { ahead_reduction = 1 uses = 1 category = rifle_equipment_techs }
'@

New-Focus -Id 'FRA_v54_the_steam_navy' -Icon 'GFX_Focus_FRA_dupuy_de_lome_innovations' -X -22 -Y 9 -Cost 10 -Filters $MIL -Hist -Ai 60 `
  -Pre @('FRA_v54_the_army_of_the_empire') `
  -Name 'The Steam Navy' `
  -Desc 'Dupuy de Lôme''s Napoléon, launched in 1850, was the first steam ship of the line in the world, and the Emperor decides to make the French navy the first in the world to depend on steam. The dockyards of Toulon, Brest and Cherbourg are to build the new fleet.' `
  -Reward @'
add_ideas = FRA_v54_idea_steam_navy
'@

New-Focus -Id 'FRA_v54_armoured_batteries' -Icon 'GFX_Focus_FRA_batteries_flottantes' -X -20 -Y 9 -Cost 10 -Filters $MIL -Hist -Ai 50 `
  -Pre @('FRA_v54_the_steam_navy') `
  -Available "date > 1855.6.1" `
  -Name 'The Floating Batteries' `
  -Desc 'Armoured, flat-bottomed batteries are built for the attack on the Russian forts at Kinburn. If they stand up to the guns, the wooden walls of every navy will be obsolete, and the Emperor will have shown the world something new.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = naval_equipment }
'@

New-Focus -Id 'FRA_v54_the_replacement_system' -Icon 'GFX_Focus_conscription' -X -26 -Y 10 -Cost 8 -Filters $MIL -Hist -Ai 40 `
  -Pre @('FRA_v54_the_imperial_guard|FRA_v54_the_rifled_musket') -Mutex @('FRA_v54_universal_service') `
  -Name 'The Replacement System' `
  -Desc 'Conscripts chosen by lot may buy a substitute, and the substitutes become the army''s long-service cadre. The middle class keeps its sons at home, the army keeps its professionals, and the radicals complain that the rich buy their way out.' `
  -Reward @'
add_stability = 0.01
add_political_power = 25
set_country_flag = v54_fra_replacement_system
'@

New-Focus -Id 'FRA_v54_universal_service' -Icon 'GFX_Focus_Mandatory_Conscription' -X -22 -Y 10 -Cost 8 -Filters $MIL -Ai 15 `
  -Pre @('FRA_v54_the_imperial_guard|FRA_v54_the_rifled_musket') -Mutex @('FRA_v54_the_replacement_system') `
  -Name 'Universal Service' `
  -Desc 'A group of officers around Marshal Niel argues for a shorter term of service for every Frenchman, with no substitutes and a large reserve. The Emperor is tempted, and the Legislature is horrified by the cost and by the principle.' `
  -Reward @'
add_manpower = 20000
add_stability = -0.02
add_war_support = 0.03
set_country_flag = v54_fra_universal_service
'@

New-Focus -Id 'FRA_v54_the_army_of_africa' -Icon 'GFX_Focus_FRA_algeria_expansion' -X -24 -Y 10 -Cost 8 -Filters $MIL -Ai 40 `
  -Pre @('FRA_v54_the_imperial_guard|FRA_v54_the_rifled_musket') `
  -Name 'The Army of Africa' `
  -Desc 'The Zouaves, Chasseurs d''Afrique and Spahis, hardened by thirty years of fighting in Algeria, are the army''s elite. The conquest is not finished: the Kabyles hold their mountains, and the generals say that one more campaign will finish them.' `
  -Reward @'
add_manpower = 10000
add_political_power = 25
'@

New-Focus -Id 'FRA_v54_faidherbe_in_senegal' -Icon 'GFX_Focus_FRA_french_senegal_developments' -X -20 -Y 10 -Cost 8 -Filters $MIL -Hist -Ai 40 `
  -Pre @('FRA_v54_the_army_of_the_empire') `
  -Available "date > 1854.12.1" `
  -Name 'Faidherbe in Senegal' `
  -Desc 'Louis Faidherbe, a young engineer officer who knows the Antilles and Algeria, is named governor of Senegal at the end of 1854. He wants to turn a string of trading posts into a colony, with forts along the river, a native infantry and the trade of the Gambia.' `
  -Reward @'
country_event = { id = v54_fra.67 }
'@

New-Focus -Id 'FRA_v54_the_roman_garrison' -Icon 'GFX_focus_generic_vatican_state' -X -24 -Y 11 -Cost 8 -Filters $POL -Hist -Ai 50 `
  -Pre @('FRA_v54_the_army_of_africa|FRA_v54_the_imperial_guard') `
  -Name 'The Garrison in Rome' `
  -Desc 'French soldiers have held Rome since 1849 to protect Pius IX from the revolution. The garrison pleases the clergy and displeases the Italians, and every politician in Paris knows that it cannot stay forever and cannot leave.' `
  -Reward @'
country_event = { id = v54_fra.70 }
'@

# ================================================================================================
# E. THE EMPIRE AND EUROPE (x -17..-9, y 8..10)
# ================================================================================================
New-Focus -Id 'FRA_v54_french_foreign_policy' -Icon 'GFX_Focus_FRA_future_of_empire' -X -13 -Y 8 -Cost 5 -Filters $POL -Ai 90 `
  -Name 'The Emperor''s Foreign Policy' `
  -Desc 'Napoleon III conducts foreign policy himself, through private envoys and a few trusted ministers. He believes in nationalities, in congresses and in rewriting the map of 1815, and the foreign ministry has learned to read his intentions in his silences.' `
  -Reward @'
add_political_power = 25
'@

New-Focus -Id 'FRA_v54_the_british_connection' -Icon 'GFX_Focus_FRA_diplo_victoria' -X -16 -Y 9 -Cost 8 -Filters $POL -Ai 40 `
  -Pre @('FRA_v54_french_foreign_policy') `
  -Name 'The British Connection' `
  -Desc 'Since Waterloo the two nations have been enemies by instinct and trading partners by interest. The Emperor, who lived in England as an exile, believes that a good understanding with London is the first need of French policy, and says so often.' `
  -Reward @'
if = {
	limit = { country_exists = ENG }
	add_opinion_modifier = { target = ENG modifier = v54_om_trade_treaty }
	reverse_add_opinion_modifier = { target = ENG modifier = v54_om_trade_treaty }
}
set_country_flag = v54_fra_british_connection
'@

New-Focus -Id 'FRA_v54_the_rhine_question' -Icon 'GFX_focus_AUS_an_improved_german_state' -X -14 -Y 9 -Cost 8 -Filters $POL -Ai 25 `
  -Pre @('FRA_v54_french_foreign_policy') `
  -Name 'France and the Rhine' `
  -Desc 'Every French government since 1815 has thought about the frontier of the Rhine, and none has said so aloud. The Emperor has promised that the Empire means peace; the army and the prefects of Alsace know what he privately means by it.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_fra_rhine_ambition
'@

New-Focus -Id 'FRA_v54_principle_of_nationalities' -Icon 'GFX_focus_generic_befriend_poland' -X -12 -Y 9 -Cost 8 -Filters $POL -Hist -Ai 50 `
  -Pre @('FRA_v54_french_foreign_policy') -Mutex @('FRA_v54_the_conservative_order') `
  -Name 'The Principle of Nationalities' `
  -Desc 'The Emperor, a one-time Carbonaro, believes that Europe will be stable only when its peoples govern themselves: Italians, Poles, Romanians and Germans. The doctrine alarms Austria and Russia, delights the liberals and gives French policy a language that no other great power speaks.' `
  -Reward @'
add_ideas = FRA_v54_idea_nationalities
set_country_flag = v54_fra_nationalities
'@

New-Focus -Id 'FRA_v54_the_conservative_order' -Icon 'GFX_Focus_Convince_Conservatives' -X -10 -Y 9 -Cost 8 -Filters $POL -Ai 15 `
  -Pre @('FRA_v54_french_foreign_policy') -Mutex @('FRA_v54_principle_of_nationalities') `
  -Name 'The Conservative Order' `
  -Desc 'The Emperor''s more cautious ministers argue that the safest French policy is to work with the established powers: with Austria to keep Italy quiet, with Britain to keep Russia out, and with the Church to keep France in order.' `
  -Reward @'
add_stability = 0.02
set_country_flag = v54_fra_conservative_order
'@

New-Focus -Id 'FRA_v54_the_polish_exiles' -Icon 'GFX_focus_generic_polish_deal' -X -16 -Y 10 -Cost 8 -Filters $POL -Ai 30 `
  -Pre @('FRA_v54_principle_of_nationalities|FRA_v54_the_british_connection') `
  -Name 'The Polish Exiles' `
  -Desc 'The Hôtel Lambert in Paris is the capital of Polish exile, and Prince Czartoryski presents the Emperor with plans for a Polish legion and a Polish army. The war with Russia makes the exiles useful, and the Emperor''s sympathy makes them hopeful.' `
  -Reward @'
add_political_power = 25
if = {
	limit = { country_exists = RUS }
	add_opinion_modifier = { target = RUS modifier = v54_om_crimean_enemy }
	reverse_add_opinion_modifier = { target = RUS modifier = v54_om_crimean_enemy }
}
'@

New-Focus -Id 'FRA_v54_the_danubian_union' -Icon 'GFX_focus_generic_attack_romania' -X -12 -Y 10 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('FRA_v54_principle_of_nationalities|FRA_v54_the_conservative_order') `
  -Available "date > 1855.12.1" `
  -Name 'The Union of the Principalities' `
  -Desc 'The Romanians of Moldavia and Wallachia want to unite under one prince, and France is the great power that has most sympathy for them. Austria and the Ottoman Empire oppose it, and the Emperor must decide how hard to press.' `
  -Reward @'
country_event = { id = v54_fra.72 }
'@

$ids = Write-FocusFiles 'france' "# Victorian 1854-1900 project: French opening branch 1854-1857 (generated by tools/gen_france_1854.ps1).`n# Included in the tree france by a marked block in common/national_focus/france_focus.txt.`n# Layout: x -27..-2, y 0..11, left of the upstream tree." 'French opening branch 1854-1857'
Patch-TreeInclude 'common/national_focus/france_focus.txt' $ids 'french 1854 opening branch'
"{0} focuses written; tree include patched" -f $ids.Count
