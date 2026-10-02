# Generates the Austrian 1854-1857 opening branch (shared focuses, localisation, tree include).
# Run from the repository root:  pwsh tools/gen_austria_1854.ps1
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
. "$PSScriptRoot/lib_focus_gen.ps1"
Reset-Focuses

$POL = 'FOCUS_FILTER_POLITICAL'; $IND = 'FOCUS_FILTER_INDUSTRY'; $MIL = 'FOCUS_FILTER_MILITARY'

function Flag($flag, $tt) { "custom_trigger_tooltip = {`n`ttooltip = $tt`n`thas_country_flag = $flag`n}" }

# ================================================================================================
# A. THE EASTERN CRISIS (x -27..-19, y 0..6)
# ================================================================================================
New-Focus -Id 'AUS_v54_eastern_crisis' -Icon 'GFX_Focus_crimean_war' -X -23 -Y 0 -Cost 5 -Filters $POL -Ai 90 `
  -Name 'The Eastern Crisis' `
  -Desc 'Russian troops occupy the Danubian Principalities, the Ottoman fleet has been destroyed at Sinope and the Western powers are drifting toward war. Count Buol must steer an Empire that owes its throne in Hungary to the Tsar yet cannot accept Russian power on the lower Danube.' `
  -Reward @'
add_political_power = 25
country_event = { id = v54_aus.50 }
'@

New-Focus -Id 'AUS_v54_armed_neutrality' -Icon 'GFX_Focus_Army_General_Mobilization_Generic_1' -X -26 -Y 1 -Cost 8 -Filters $POL -Hist -Ai 80 `
  -Pre @('AUS_v54_eastern_crisis') -Mutex @('AUS_v54_tsars_friend','AUS_v54_western_alliance','AUS_v54_good_offices') `
  -Available (Flag 'v54_aus_crimea_armed_neutrality' 'v54_tt_aus_stance_armed') `
  -Name 'Armed Neutrality' `
  -Desc 'Vienna will neither fight for the Tsar nor for the Sultan. The army is placed on a war footing along the Galician and Transylvanian frontiers, and Russia is invited to leave the Principalities. The Empire speaks as a power whose neutrality has a price.' `
  -Reward @'
add_political_power = 25
add_war_support = 0.03
set_country_flag = v54_aus_d1_done
'@

New-Focus -Id 'AUS_v54_tsars_friend' -Icon 'GFX_focus_marriage_romanovs' -X -24 -Y 1 -Cost 8 -Filters $POL -Ai 10 `
  -Pre @('AUS_v54_eastern_crisis') -Mutex @('AUS_v54_armed_neutrality','AUS_v54_western_alliance','AUS_v54_good_offices') `
  -Available (Flag 'v54_aus_crimea_pro_russia' 'v54_tt_aus_stance_russia') `
  -Name 'Faithful to the Tsar' `
  -Desc 'In 1849 Russian divisions saved the Habsburgs in Hungary. Whatever Paris and London say, Vienna will not repay that debt with an ultimatum. The Emperor assures Nicholas of the Empire''s benevolent neutrality, and Russian garrisons in Poland are free to look elsewhere.' `
  -Reward @'
add_political_power = 50
add_stability = -0.02
set_country_flag = v54_aus_d1_done
'@

New-Focus -Id 'AUS_v54_western_alliance' -Icon 'GFX_Focus_Diplomacy_ITA_shine' -X -22 -Y 1 -Cost 8 -Filters $POL -Ai 15 `
  -Pre @('AUS_v54_eastern_crisis') -Mutex @('AUS_v54_armed_neutrality','AUS_v54_tsars_friend','AUS_v54_good_offices') `
  -Available (Flag 'v54_aus_crimea_joined_west' 'v54_tt_aus_stance_west') `
  -Name 'With the Western Powers' `
  -Desc 'Austria has joined Britain and France against Russia. The decision gives Vienna a place at the table and a claim on the Principalities, and it costs the friendship of the one power that had stood by the Empire in 1849.' `
  -Reward @'
add_war_support = 0.05
add_political_power = 25
set_country_flag = v54_aus_d1_done
'@

New-Focus -Id 'AUS_v54_good_offices' -Icon 'GFX_focus_AUS_diplomatic_effort' -X -20 -Y 1 -Cost 8 -Filters $POL -Ai 30 `
  -Pre @('AUS_v54_eastern_crisis') -Mutex @('AUS_v54_armed_neutrality','AUS_v54_tsars_friend','AUS_v54_western_alliance') `
  -Available (Flag 'v54_aus_crimea_mediation' 'v54_tt_aus_stance_mediation') `
  -Name 'Good Offices' `
  -Desc 'Vienna offers itself as the honest broker between the belligerents. The Vienna Note of 1853 failed, but the Empire has interests on both sides and the means to try again.' `
  -Reward @'
add_political_power = 50
add_to_variable = { prestige_score = 5 }
set_country_flag = v54_aus_d1_done
'@

New-Focus -Id 'AUS_v54_secret_assurances' -Icon 'GFX_Focus_Establish_Spy_Network' -X -24 -Y 2 -Cost 8 -Filters $POL -Ai 10 `
  -Pre @('AUS_v54_tsars_friend') `
  -Name 'Assurances to St Petersburg' `
  -Desc 'A confidential exchange with the Tsar''s ministers leaves no doubt of Austria''s intentions: no hostile act while Russia keeps the Pruth. The Western chancelleries will learn of it sooner or later.' `
  -Reward @'
country_event = { id = v54_aus.59 }
'@

New-Focus -Id 'AUS_v54_convention_with_the_porte' -Icon 'GFX_Focus_Break_Treaty' -X -26 -Y 2 -Cost 8 -Filters $POL -Hist -Ai 80 `
  -Pre @('AUS_v54_armed_neutrality|AUS_v54_western_alliance') `
  -Available "date > 1854.5.15" `
  -Name 'The Convention with the Porte' `
  -Desc 'Austria and the Ottoman Empire agree that Austrian troops may enter the Principalities once the Russians have left. For Vienna it is a way to keep the Danube closed to Russia without firing a shot; for the Sultan it is a lesser evil.' `
  -Reward @'
country_event = { id = v54_aus.55 }
'@

New-Focus -Id 'AUS_v54_four_points' -Icon 'GFX_Focus_berlin_conference' -X -22 -Y 2 -Cost 8 -Filters $POL -Ai 60 `
  -Pre @('AUS_v54_armed_neutrality|AUS_v54_western_alliance|AUS_v54_good_offices') `
  -Available "date > 1854.7.15" `
  -Name 'The Four Points' `
  -Desc 'Britain, France and Austria set out the conditions on which they will negotiate: an end to the Russian protectorate over the Principalities, free navigation of the Danube, a revision of the Straits convention and a common guarantee for the Sultan''s Christian subjects. Russia is to be offered peace on terms that keep her great-power status.' `
  -Reward @'
country_event = { id = v54_aus.51 }
'@

New-Focus -Id 'AUS_v54_occupy_the_principalities' -Icon 'GFX_focus_AUS_protector_of_the_danube' -X -26 -Y 3 -Cost 10 -Filters $POL -Hist -Ai 80 `
  -Pre @('AUS_v54_convention_with_the_porte') `
  -Available "date > 1854.8.1" `
  -Name 'Occupation of the Principalities' `
  -Desc 'As the Russians withdraw across the Pruth, Austrian divisions march into Moldavia and Wallachia. The Empire now holds both banks of the lower Danube, and no Romanian patriot or Russian diplomat doubts that Vienna intends to keep a say in their future.' `
  -Reward @'
country_event = { id = v54_aus.56 }
'@

New-Focus -Id 'AUS_v54_december_treaty' -Icon 'GFX_focus_generic_royal_wedding' -X -22 -Y 3 -Cost 10 -Filters $POL -Hist -Ai 60 `
  -Pre @('AUS_v54_four_points') `
  -Available "date > 1854.11.1" `
  -Name 'The Treaty of 2 December' `
  -Desc 'Austria binds itself to Britain and France: if Russia does not accept the Four Points, the three powers will consult on further measures, and Vienna promises to defend the Principalities. It is the closest the Empire comes to a Western alliance, and the Tsar takes note.' `
  -Reward @'
country_event = { id = v54_aus.57 }
'@

New-Focus -Id 'AUS_v54_vienna_conferences' -Icon 'GFX_focus_AFG_kabul_conference' -X -20 -Y 3 -Cost 10 -Filters $POL -Ai 50 `
  -Pre @('AUS_v54_good_offices|AUS_v54_four_points') `
  -Available "date > 1855.3.1" `
  -Name 'The Vienna Conferences' `
  -Desc 'Delegates of the belligerents and of Austria meet in Vienna to discuss the Four Points. The third point, the limitation of Russian naval power in the Black Sea, is the stumbling block, and every capital watches to see which way Austria will lean.' `
  -Reward @'
country_event = { id = v54_aus.58 }
'@

New-Focus -Id 'AUS_v54_the_ultimatum' -Icon 'GFX_Focus_AUH_Deny_Czech_Demands' -X -24 -Y 4 -Cost 10 -Filters $POL -Hist -Ai 70 `
  -Pre @('AUS_v54_occupy_the_principalities|AUS_v54_december_treaty|AUS_v54_vienna_conferences') `
  -Available "date > 1855.10.1`nhas_global_flag = v54_crimean_war_active" `
  -Name 'The Ultimatum to St Petersburg' `
  -Desc 'The war has dragged on and Austria is ready to bring it to an end. Vienna presents the Tsar with a short and final choice: accept the Four Points as the basis of peace, or face a break in relations and the possibility of an Austrian declaration of war.' `
  -Reward @'
country_event = { id = v54_aus.63 }
'@

New-Focus -Id 'AUS_v54_congress_of_paris' -Icon 'GFX_Focus_berlin_conference' -X -24 -Y 5 -Cost 10 -Filters $POL -Hist -Ai 70 `
  -Pre @('AUS_v54_the_ultimatum|AUS_v54_secret_assurances|AUS_v54_good_offices') `
  -Available "has_global_flag = v54_crimean_war_ended" `
  -Name 'Austria at the Congress of Paris' `
  -Desc 'The plenipotentiaries gather in Paris. Austria has no territory to gain, but a great deal to defend: the Principalities must not be united under a Russian or French protégé, and the Danube must remain open to Austrian trade.' `
  -Reward @'
country_event = { id = v54_aus.64 }
'@

New-Focus -Id 'AUS_v54_new_order_on_the_danube' -Icon 'GFX_focus_AUH_encourage_trade_transport' -X -24 -Y 6 -Cost 10 -Filters $POL -Ai 50 `
  -Pre @('AUS_v54_congress_of_paris') `
  -Name 'A New Order on the Danube' `
  -Desc 'With peace restored, Austria must decide how to use its position at the mouth of the Danube: withdraw from the Principalities as promised, open the river to trade, and court the new rulers in Bucharest and Jassy.' `
  -Reward @'
add_stability = 0.02
add_political_power = 25
set_country_flag = v54_aus_danube_order
'@

# ================================================================================================
# B. THE NEO-ABSOLUTIST STATE (x -17..-9, y 0..3)
# ================================================================================================
New-Focus -Id 'AUS_v54_sylvester_patent' -Icon 'GFX_Focus_Justice_police_force' -X -13 -Y 0 -Cost 5 -Filters $POL -Hist -Ai 90 `
  -Name 'The Sylvester Patent' `
  -Desc 'Since the patent of 31 December 1851 the Emperor has ruled without a constitution. Franz Joseph, at twenty-three, believes that a single will at the centre is what the Empire needs after 1848. The task is now to turn that belief into administration.' `
  -Reward @'
add_political_power = 50
add_stability = 0.02
'@

New-Focus -Id 'AUS_v54_bach_system' -Icon 'GFX_focus_AUS_apprentice_programmes' -X -16 -Y 1 -Cost 10 -Filters $POL -Hist -Ai 80 `
  -Pre @('AUS_v54_sylvester_patent') `
  -Name 'The Bach System' `
  -Desc 'Alexander von Bach''s officials, the ''Bach hussars'', administer every crown land by the same German-language rules. Taxes are collected, roads are built and justice is uniform, and the Hungarians, Czechs and Italians learn what it means to be governed from Vienna.' `
  -Reward @'
add_ideas = AUS_v54_idea_bach_system
v54_aus_change_risk = { HUN = 0.04 CZE = 0.03 CRO = 0 POL = 0 }
'@

New-Focus -Id 'AUS_v54_imperial_marriage' -Icon 'GFX_Focus_Royal_Marriage' -X -10 -Y 1 -Cost 5 -Filters $POL -Hist -Ai 70 `
  -Pre @('AUS_v54_sylvester_patent') `
  -Available "date > 1854.3.1" `
  -Name 'The Emperor''s Marriage' `
  -Desc 'The young Emperor has chosen his cousin Elisabeth of Bavaria over his mother''s candidate. The wedding in the Augustinerkirche is a rare moment of public affection for the dynasty, and the Empress will in time become the Hungarians'' most sympathetic voice at court.' `
  -Reward @'
country_event = { id = v54_aus.52 }
'@

New-Focus -Id 'AUS_v54_concordat_negotiations' -Icon 'GFX_Focus_Catholism_Papal_Bull' -X -16 -Y 2 -Cost 10 -Filters $POL -Hist -Ai 70 `
  -Pre @('AUS_v54_bach_system') `
  -Available "date > 1854.10.1" `
  -Name 'Negotiations with the Holy See' `
  -Desc 'Cardinal Rauscher and the Emperor''s Catholic advisers want to settle the relations between Church and State once and for all. The price will be paid in schools, courts and marriage law, and the Josephinist bureaucracy is watching.' `
  -Reward @'
country_event = { id = v54_aus.40 }
'@

New-Focus -Id 'AUS_v54_police_and_censorship' -Icon 'GFX_focus_OTO_Police_Force' -X -14 -Y 2 -Cost 8 -Filters $POL -Ai 60 `
  -Pre @('AUS_v54_bach_system') `
  -Name 'Police and Censorship' `
  -Desc 'A gendarmerie modelled on the French one watches the provinces, the press is licensed and the theatre is read before it is played. Order is kept, and the price is paid in resentment that does not show on the surface.' `
  -Reward @'
add_stability = 0.03
add_political_power = -25
v54_aus_change_risk = { HUN = -0.02 CZE = -0.02 CRO = 0 POL = 0 }
'@

New-Focus -Id 'AUS_v54_end_the_state_of_siege' -Icon 'GFX_Focus_Freedom_Marriage' -X -12 -Y 2 -Cost 8 -Filters $POL -Hist -Ai 60 `
  -Pre @('AUS_v54_sylvester_patent') -Mutex @('AUS_v54_keep_martial_law') `
  -Name 'End the State of Siege' `
  -Desc 'The martial law proclaimed in 1848 is lifted in the Italian provinces and in Hungary. The Emperor wishes to show that the Empire has returned to normal, and Radetzky, who still commands in Milan, agrees that the moment has come.' `
  -Reward @'
add_stability = 0.01
if = {
	limit = { has_variable = ITA_UPROAR_RISK }
	add_to_variable = { ITA_UPROAR_RISK = -0.05 }
	clamp_variable = { var = ITA_UPROAR_RISK min = 0 max = 1 }
}
set_country_flag = v54_aus_siege_lifted
'@

New-Focus -Id 'AUS_v54_keep_martial_law' -Icon 'GFX_Focus_Army_Crush' -X -10 -Y 2 -Cost 8 -Filters $POL -Ai 20 `
  -Pre @('AUS_v54_sylvester_patent') -Mutex @('AUS_v54_end_the_state_of_siege') `
  -Name 'Keep Martial Law' `
  -Desc 'The Italian provinces and Hungary remain under military administration. Officers who restored the Empire in 1849 see no reason to trust the calm, and the Emperor does not contradict them.' `
  -Reward @'
add_political_power = 25
if = {
	limit = { has_variable = ITA_UPROAR_RISK }
	add_to_variable = { ITA_UPROAR_RISK = 0.03 }
	clamp_variable = { var = ITA_UPROAR_RISK min = 0 max = 1 }
}
set_country_flag = v54_aus_martial_law
'@

New-Focus -Id 'AUS_v54_imperial_council' -Icon 'GFX_Focus_Law_revision' -X -15 -Y 3 -Cost 8 -Filters $POL -Ai 50 `
  -Pre @('AUS_v54_concordat_negotiations|AUS_v54_police_and_censorship') `
  -Name 'The Imperial Council' `
  -Desc 'The Reichsrat of 1851 is an advisory body of the Emperor''s own choosing: it sits in secret, speaks when asked and has no vote. It is nevertheless the nearest thing the Empire has to a parliament, and the officials who staff it will be the Empire''s ministers for a decade.' `
  -Reward @'
add_political_power = 50
set_country_flag = v54_aus_imperial_council
'@

New-Focus -Id 'AUS_v54_hungary_under_bach' -Icon 'GFX_focus_AUS_hungaryrailways' -X -17 -Y 3 -Cost 10 -Filters $POL -Ai 50 `
  -Pre @('AUS_v54_bach_system') `
  -Name 'Hungary under Bach' `
  -Desc 'Hungary has lost its diet, its counties and its historic constitution. German-speaking officials, Czech clerks and Austrian gendarmes govern the kingdom of St Stephen. The Magyar gentry have not forgotten 1848, and they have time.' `
  -Reward @'
country_event = { id = v54_aus.71 }
'@

New-Focus -Id 'AUS_v54_court_camarilla' -Icon 'GFX_Focus_AUH_Deny_Czech_Demands' -X -11 -Y 3 -Cost 8 -Filters $POL -Ai 20 `
  -Pre @('AUS_v54_imperial_marriage|AUS_v54_end_the_state_of_siege|AUS_v54_keep_martial_law') `
  -Name 'The Court Camarilla' `
  -Desc 'Count Grünne, the Emperor''s adjutant-general, and the circle around the Archduchess Sophie decide who is promoted, who is heard and who is forgotten. The Emperor prefers to have men he knows around him, and the army pays for the preference.' `
  -Reward @'
add_ideas = AUS_v54_idea_court_camarilla
add_political_power = 25
'@

# ================================================================================================
# C. FINANCES AND RAILWAYS (x -8..-2, y 0..3)
# ================================================================================================
New-Focus -Id 'AUS_v54_state_of_the_finances' -Icon 'GFX_Focus_Bankruptcy' -X -5 -Y 0 -Cost 5 -Filters $IND -Ai 90 `
  -Name 'The State of the Finances' `
  -Desc 'Revenue grows but spending outruns it. The Empire is paying for the army of 1849, the railways and the pensions of its officials, and the Crimean mobilisation will add to the bill. Finance ministers speak of a deficit that no budget of the 1850s has closed.' `
  -Reward @'
add_political_power = 25
country_event = { id = v54_aus.60 }
'@

New-Focus -Id 'AUS_v54_national_loan' -Icon 'GFX_Focus_financial_westernisation' -X -8 -Y 1 -Cost 8 -Filters $IND -Hist -Ai 70 `
  -Pre @('AUS_v54_state_of_the_finances') `
  -Available "set_temp_variable = { loan_size_to_check = 250 }`nhas_less_than_specific_loan_size = yes" `
  -Name 'The National Loan of 1854' `
  -Desc 'To pay for the mobilisation, Vienna appeals to the patriotism of its subjects. A voluntary national loan is opened, with subscriptions in every crown land and official encouragement in every parish. Rothschild and the great houses take a share; the rest is raised from people who would rather not be asked twice.' `
  -Reward @'
set_temp_variable = { loans_amount = 8 }
take_loan_effect = yes
add_stability = -0.01
'@

New-Focus -Id 'AUS_v54_railway_policy' -Icon 'GFX_Focus_transport_railroad_development' -X -4 -Y 1 -Cost 10 -Filters $IND -Hist -Ai 60 `
  -Pre @('AUS_v54_state_of_the_finances') `
  -Name 'Railway Policy' `
  -Desc 'The state owns the main lines but cannot afford to finish them. Ministers argue whether to continue as builder or to sell to private companies, and foreign capital, above all French, is waiting to buy.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = transport_tech }
add_political_power = 25
'@

New-Focus -Id 'AUS_v54_trade_treaty_with_prussia' -Icon 'GFX_focus_AUH_encourage_trade_transport' -X -8 -Y 2 -Cost 8 -Filters $IND -Ai 50 `
  -Pre @('AUS_v54_state_of_the_finances') `
  -Name 'The Austro-Prussian Trade Treaty' `
  -Desc 'Bruck''s plan of a customs union of all Central Europe has failed, but the treaty of 1853 has given Austria a privileged position next to the Zollverein. Berlin has agreed to talk about further tariff reductions, and the south German states are watching.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = economics_tech }
if = {
	limit = { country_exists = PRS }
	add_opinion_modifier = { target = PRS modifier = v54_om_trade_treaty }
	reverse_add_opinion_modifier = { target = PRS modifier = v54_om_trade_treaty }
}
'@

New-Focus -Id 'AUS_v54_semmering_railway' -Icon 'GFX_goal_generic_construct_infrastructure' -X -4 -Y 2 -Cost 10 -Filters $IND -Hist -Ai 50 `
  -Pre @('AUS_v54_railway_policy') `
  -Available "date > 1854.6.1" `
  -Name 'The Semmering Railway' `
  -Desc 'Carl von Ghega''s line across the Semmering pass, the first mountain railway in the world, joins Vienna to Trieste by rail. Its viaducts and tunnels are a triumph of engineering and a promise of what the state can build.' `
  -Reward @'
4 = { add_building_construction = { type = infrastructure level = 1 instant_build = yes } }
add_political_power = 25
'@

New-Focus -Id 'AUS_v54_creditanstalt' -Icon 'GFX_Focus_banks' -X -6 -Y 3 -Cost 10 -Filters $IND -Hist -Ai 50 `
  -Pre @('AUS_v54_national_loan') `
  -Available "date > 1855.8.1" `
  -Name 'The Creditanstalt' `
  -Desc 'Anselm von Rothschild and his partners found the Creditanstalt für Handel und Gewerbe, modelled on the Parisian Crédit Mobilier. Government licences, French capital and Viennese ambition will finance industry across the Empire.' `
  -Reward @'
add_ideas = AUS_v54_idea_creditanstalt
add_tech_bonus = { bonus = 0.75 uses = 1 category = economics_tech }
'@

New-Focus -Id 'AUS_v54_danube_steam_navigation' -Icon 'GFX_focus_AUS_protector_of_the_danube' -X -2 -Y 3 -Cost 8 -Filters $IND -Ai 40 `
  -Pre @('AUS_v54_railway_policy') `
  -Name 'The Danube Steamship Company' `
  -Desc 'The Danube Steam Navigation Company carries grain, timber and passengers from Vienna to the Black Sea. Whoever controls the lower Danube controls the outlet of Hungary''s wheat, and the company is as much an arm of policy as of commerce.' `
  -Reward @'
add_ideas = AUS_v54_idea_danube_steam
'@

# ================================================================================================
# D. THE IMPERIAL ARMY (x -27..-19, y 8..11)
# ================================================================================================
New-Focus -Id 'AUS_v54_army_in_1854' -Icon 'GFX_Focus_Army_Reforms' -X -23 -Y 8 -Cost 5 -Filters $MIL -Ai 90 `
  -Name 'The Imperial Army in 1854' `
  -Desc 'The army that won in Italy and Hungary is long-serving, disciplined and badly paid. Its officers are drawn from the nobility and the military frontier, its regiments speak a dozen languages, and the budget has not changed since Radetzky''s victories.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_aus_army_focus_started
'@

New-Focus -Id 'AUS_v54_mobilisation_of_1854' -Icon 'GFX_Focus_Army_Timeplan_Mobilisation' -X -26 -Y 9 -Cost 10 -Filters $MIL -Hist -Ai 80 `
  -Pre @('AUS_v54_army_in_1854') -Mutex @('AUS_v54_economise_on_the_army') `
  -Available "date > 1854.4.1`nOR = {`n`thas_country_flag = v54_aus_crimea_armed_neutrality`n`thas_country_flag = v54_aus_crimea_joined_west`n}" `
  -Name 'The Mobilisation of 1854' `
  -Desc 'Reservists are called up, horses requisitioned and depots filled. More than three hundred thousand men are put under arms, a show of force that no neighbour can ignore and no finance minister can afford.' `
  -Reward @'
set_temp_variable = { money_to_gain = -2 }
add_money_with_tooltip_effect = yes
add_manpower = 30000
add_war_support = 0.05
add_stability = -0.02
add_ideas = AUS_v54_idea_mobilisation_1854
'@

New-Focus -Id 'AUS_v54_economise_on_the_army' -Icon 'GFX_Focus_Army_Crush' -X -20 -Y 9 -Cost 8 -Filters $MIL -Ai 20 `
  -Pre @('AUS_v54_army_in_1854') -Mutex @('AUS_v54_mobilisation_of_1854') `
  -Name 'Economise on the Army' `
  -Desc 'The treasury cannot sustain a war footing. Regiments are kept at peace strength, furloughs are extended and the army''s share of the budget is held down. The Emperor accepts the reasoning, and the generals do not.' `
  -Reward @'
set_temp_variable = { money_to_gain = 1 }
add_money_with_tooltip_effect = yes
add_stability = 0.01
add_war_support = -0.03
'@

New-Focus -Id 'AUS_v54_lorenz_rifle' -Icon 'GFX_Focus_Weapon_Gun_1_WW1' -X -24 -Y 9 -Cost 10 -Filters $MIL -Hist -Ai 60 `
  -Pre @('AUS_v54_army_in_1854') `
  -Name 'The Lorenz Rifle' `
  -Desc 'Lieutenant Josef Lorenz''s muzzle-loading rifle, adopted in 1854, is accurate at long range and takes the Minie ball. The infantry will be re-armed regiment by regiment as the arsenals can manage.' `
  -Reward @'
add_tech_bonus = { ahead_reduction = 1 uses = 1 category = rifle_equipment_techs }
'@

New-Focus -Id 'AUS_v54_hess_and_the_general_staff' -Icon 'GFX_Focus_Army_Reformed' -X -22 -Y 9 -Cost 10 -Filters $MIL -Ai 40 `
  -Pre @('AUS_v54_army_in_1854') `
  -Name 'Hess and the General Staff' `
  -Desc 'Baron Hess, the quartermaster-general, is the best planner in the army and the author of its war plans. He distrusts the camarilla and is distrusted by it. Whether his plans are carried out depends on whether the Emperor decides to listen.' `
  -Reward @'
add_ideas = AUS_v54_idea_hess_plans
add_political_power = 25
'@

New-Focus -Id 'AUS_v54_army_of_observation' -Icon 'GFX_focus_AUS_defence_of_the_homeland' -X -26 -Y 10 -Cost 8 -Filters $MIL -Ai 60 `
  -Pre @('AUS_v54_mobilisation_of_1854') `
  -Name 'The Army of Observation' `
  -Desc 'Two armies are posted, one in Galicia and one in Transylvania, with orders to watch the Russians and to be ready. Their presence ties down Russian divisions that would otherwise be sent south, and their upkeep ties down Austrian gold.' `
  -Reward @'
add_war_support = 0.03
if = {
	limit = { country_exists = RUS }
	add_opinion_modifier = { target = RUS modifier = v54_om_crimean_disfavour }
	reverse_add_opinion_modifier = { target = RUS modifier = v54_om_crimean_disfavour }
}
set_country_flag = v54_aus_army_in_galicia
'@

New-Focus -Id 'AUS_v54_military_frontier' -Icon 'GFX_Focus_Army_General_Mobilization_Generic_1' -X -22 -Y 10 -Cost 8 -Filters $MIL -Ai 40 `
  -Pre @('AUS_v54_army_in_1854') `
  -Name 'The Military Frontier' `
  -Desc 'The Croatian and Serbian borderers, farmers in peace and soldiers in war, supply the Empire with its toughest infantry. Their privileges cost little and their regiments fight well, and Vienna has no wish to see either change.' `
  -Reward @'
add_manpower = 15000
add_war_support = 0.02
'@

New-Focus -Id 'AUS_v54_demobilisation' -Icon 'GFX_Focus_Army_Crush' -X -26 -Y 11 -Cost 8 -Filters $MIL -Hist -Ai 70 `
  -Pre @('AUS_v54_army_of_observation') `
  -Available "date > 1855.6.1" `
  -Name 'Demobilisation' `
  -Desc 'The danger has passed and the money has run out. Regiments are sent home, depots are emptied and the army budget is cut to the bone. The savings are real, and so is the loss of the army''s edge.' `
  -Reward @'
if = { limit = { has_idea = AUS_v54_idea_mobilisation_1854 } remove_ideas = AUS_v54_idea_mobilisation_1854 }
add_ideas = AUS_idea_army_spending_cuts
set_temp_variable = { money_to_gain = 3 }
add_money_with_tooltip_effect = yes
add_stability = 0.02
add_war_support = -0.03
'@

# ================================================================================================
# E. THE ITALIAN PROVINCES (x -17..-9, y 8..10)
# ================================================================================================
New-Focus -Id 'AUS_v54_lombardy_venetia' -Icon 'GFX_Focus_Diplomacy_ITA_shine' -X -13 -Y 8 -Cost 5 -Filters $POL -Ai 90 `
  -Name 'Lombardy-Venetia' `
  -Desc 'The richest provinces of the Empire are also the least reconciled. The Italian middle classes read Piedmontese newspapers, the aristocracy stays at home, and Marshal Radetzky rules from Milan with the army at his back.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_aus_italy_focus_started
'@

New-Focus -Id 'AUS_v54_the_old_marshal' -Icon 'GFX_Focus_Army_Reformed' -X -12 -Y 9 -Cost 8 -Filters $POL -Ai 60 `
  -Pre @('AUS_v54_lombardy_venetia') `
  -Name 'The Old Marshal' `
  -Desc 'Radetzky is in his late eighties and still in the saddle. His name keeps the army loyal and the Italians quiet, and nobody in Vienna wants to think about who will follow him.' `
  -Reward @'
add_ideas = AUS_v54_idea_radetzky_in_italy
if = {
	limit = { has_variable = ITA_UPROAR_RISK }
	add_to_variable = { ITA_UPROAR_RISK = -0.03 }
	clamp_variable = { var = ITA_UPROAR_RISK min = 0 max = 1 }
}
'@

New-Focus -Id 'AUS_v54_sequestration_of_exiles_estates' -Icon 'GFX_Focus_Break_Treaty' -X -16 -Y 9 -Cost 8 -Filters $POL -Hist -Ai 50 `
  -Pre @('AUS_v54_lombardy_venetia') -Mutex @('AUS_v54_conciliate_the_exiles') `
  -Name 'Maintain the Sequestration' `
  -Desc 'The estates of Lombard exiles who took Piedmontese citizenship have been sequestrated since 1853, and Turin has withdrawn its envoy in protest. Vienna will not give way to what it regards as an effort to open a door to revolution.' `
  -Reward @'
if = {
	limit = { country_exists = PIE }
	add_opinion_modifier = { target = PIE modifier = v54_om_crimean_disfavour }
	reverse_add_opinion_modifier = { target = PIE modifier = v54_om_crimean_disfavour }
}
add_political_power = 25
'@

New-Focus -Id 'AUS_v54_conciliate_the_exiles' -Icon 'GFX_focus_generic_befriend_hungary' -X -14 -Y 9 -Cost 8 -Filters $POL -Ai 25 `
  -Pre @('AUS_v54_lombardy_venetia') -Mutex @('AUS_v54_sequestration_of_exiles_estates') `
  -Name 'Conciliate the Exiles' `
  -Desc 'The sequestration is lifted for those who return and submit. Some of the Lombard families come back, Turin restores its envoy, and the case for patience is argued in Vienna by those who remember how quickly the provinces turned in 1848.' `
  -Reward @'
if = {
	limit = { country_exists = PIE }
	add_opinion_modifier = { target = PIE modifier = v54_om_crimean_sympathy }
	reverse_add_opinion_modifier = { target = PIE modifier = v54_om_crimean_sympathy }
}
if = {
	limit = { has_variable = ITA_UPROAR_RISK }
	add_to_variable = { ITA_UPROAR_RISK = -0.03 }
	clamp_variable = { var = ITA_UPROAR_RISK min = 0 max = 1 }
}
'@

New-Focus -Id 'AUS_v54_the_quadrilateral' -Icon 'GFX_focus_AUS_defence_of_the_homeland' -X -10 -Y 9 -Cost 10 -Filters $MIL -Ai 40 `
  -Pre @('AUS_v54_lombardy_venetia') `
  -Name 'The Quadrilateral' `
  -Desc 'Verona, Legnago, Mantua and Peschiera, between the Mincio and the Adige, form the fortress belt on which every Austrian plan for Italy depends. The forts are kept in repair and the garrisons are never reduced.' `
  -Reward @'
add_ideas = AUS_v54_idea_the_quadrilateral
'@

New-Focus -Id 'AUS_v54_amnesty_of_1857' -Icon 'GFX_Focus_Freedom_Marriage' -X -14 -Y 10 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('AUS_v54_conciliate_the_exiles|AUS_v54_the_old_marshal') `
  -Available "date > 1856.12.1" `
  -Name 'The Amnesty of 1857' `
  -Desc 'To mark the Emperor''s visit to the Italian provinces, political prisoners are pardoned and the sequestrations are lifted. The gesture is generous, the reception is polite, and nobody supposes that it will change the Italians'' minds.' `
  -Reward @'
add_stability = 0.01
set_country_flag = v54_aus_amnesty_done
if = {
	limit = { has_variable = ITA_UPROAR_RISK }
	add_to_variable = { ITA_UPROAR_RISK = -0.05 }
	clamp_variable = { var = ITA_UPROAR_RISK min = 0 max = 1 }
}
'@

New-Focus -Id 'AUS_v54_radetzkys_successor' -Icon 'GFX_Focus_Army_Reformed' -X -12 -Y 10 -Cost 8 -Filters $POL -Hist -Ai 50 `
  -Pre @('AUS_v54_the_old_marshal') `
  -Available "date > 1856.9.1" `
  -Name 'A Successor for Radetzky' `
  -Desc 'The marshal asks to be relieved and the Emperor must choose a successor for Italy. The army wants a soldier, the court wants a prince, and the Italians would prefer a man who speaks their language.' `
  -Reward @'
country_event = { id = v54_aus.61 }
'@

$ids = Write-FocusFiles 'austria' "# Victorian 1854-1900 project: Austrian opening branch 1854-1857 (generated by tools/gen_austria_1854.ps1).`n# Included in the tree aus_empire_focus by a marked block in common/national_focus/austrian_empire_focus.txt.`n# Layout: x -27..-2, y 0..11, left of the upstream political tree (which starts at x = 1)." 'Austrian opening branch 1854-1857'
Patch-TreeInclude 'common/national_focus/austrian_empire_focus.txt' $ids 'austrian 1854 opening branch'
"{0} focuses written; tree include patched" -f $ids.Count
