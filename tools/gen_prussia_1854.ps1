# Generates the Prussian 1854-1857 opening branch (shared focuses, localisation, tree include).
# Run from the repository root:  pwsh tools/gen_prussia_1854.ps1
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
. "$PSScriptRoot/lib_focus_gen.ps1"
Reset-Focuses

$POL = 'FOCUS_FILTER_POLITICAL'; $IND = 'FOCUS_FILTER_INDUSTRY'; $MIL = 'FOCUS_FILTER_MILITARY'
function Flag($flag, $tt) { "custom_trigger_tooltip = {`n`ttooltip = $tt`n`thas_country_flag = $flag`n}" }

# ================================================================================================
# A. THE EASTERN CRISIS AND PRUSSIAN NEUTRALITY (x -27..-19, y 0..5)
# ================================================================================================
New-Focus -Id 'PRS_v54_the_eastern_crisis' -Icon 'GFX_Focus_crimean_war' -X -23 -Y 0 -Cost 5 -Filters $POL -Ai 90 `
  -Name 'Prussia and the Eastern Crisis' `
  -Desc 'Russia is at war with the Ottoman Empire, Britain and France are preparing to join the Sultan, and every capital wants to know where Prussia stands. The King regards the Tsar as family and the Western powers as heirs of the Revolution, but Berlin cannot afford to be on the losing side of a great war.' `
  -Reward @'
add_political_power = 25
country_event = { id = v54_pru.50 }
'@

New-Focus -Id 'PRS_v54_manteuffels_neutrality' -Icon 'GFX_goal_focus_prussia_auswartiges_amt' -X -26 -Y 1 -Cost 8 -Filters $POL -Hist -Ai 80 `
  -Pre @('PRS_v54_the_eastern_crisis') -Mutex @('PRS_v54_the_russian_party','PRS_v54_the_western_party') `
  -Available (Flag 'v54_pru_crimea_neutral' 'v54_tt_pru_stance_neutral') `
  -Name 'Manteuffel''s Neutrality' `
  -Desc 'The Minister-President will keep Prussia out of the war and out of every alliance that could drag her in. Neutrality is not heroic, but it spares the army, the finances and the King''s conscience, and it leaves Berlin free to move when the other powers are exhausted.' `
  -Reward @'
add_political_power = 50
add_stability = 0.01
set_country_flag = v54_pru_a1_done
'@

New-Focus -Id 'PRS_v54_the_russian_party' -Icon 'GFX_focus_marriage_romanovs' -X -24 -Y 1 -Cost 8 -Filters $POL -Ai 20 `
  -Pre @('PRS_v54_the_eastern_crisis') -Mutex @('PRS_v54_manteuffels_neutrality','PRS_v54_the_western_party') `
  -Available (Flag 'v54_pru_crimea_pro_russia' 'v54_tt_pru_stance_russia') `
  -Name 'The Russian Party' `
  -Desc 'The Gerlach brothers and the Kreuzzeitung circle hold that the monarchical powers must stand together against the West. The King listens, and the Tsar is assured of a benevolent neutrality that costs Prussia nothing on the Vistula and a good deal in London.' `
  -Reward @'
add_political_power = 25
add_stability = 0.01
set_country_flag = v54_pru_a1_done
'@

New-Focus -Id 'PRS_v54_the_western_party' -Icon 'GFX_Focus_attract_british_goods' -X -22 -Y 1 -Cost 8 -Filters $POL -Ai 15 `
  -Pre @('PRS_v54_the_eastern_crisis') -Mutex @('PRS_v54_manteuffels_neutrality','PRS_v54_the_russian_party') `
  -Available (Flag 'v54_pru_crimea_pro_west' 'v54_tt_pru_stance_west') `
  -Name 'The Western Party' `
  -Desc 'Bunsen, Bethmann-Hollweg and the liberal conservatives of the Wochenblatt see in Britain Prussia''s natural partner and in Russian autocracy her natural rival. They persuade the Prince of Prussia, but not the King.' `
  -Reward @'
add_political_power = 25
add_war_support = 0.02
set_country_flag = v54_pru_a1_done
'@

New-Focus -Id 'PRS_v54_the_bonin_affair' -Icon 'GFX_goal_focus_prussia_war_minister_bonin' -X -26 -Y 2 -Cost 8 -Filters $POL -Hist -Ai 60 `
  -Pre @('PRS_v54_manteuffels_neutrality|PRS_v54_the_russian_party|PRS_v54_the_western_party') `
  -Available "date > 1854.2.1" `
  -Name 'The Bonin Affair' `
  -Desc 'General von Bonin, the Minister of War, has spoken openly for an understanding with the Western powers, and Bunsen in London has sent the King a memorandum urging the same. The court is outraged, and the King must decide how to answer the two men who tell him what he does not want to hear.' `
  -Reward @'
country_event = { id = v54_pru.51 }
'@

New-Focus -Id 'PRS_v54_the_april_treaty' -Icon 'GFX_Focus_berlin_conference' -X -24 -Y 2 -Cost 8 -Filters $POL -Hist -Ai 60 `
  -Pre @('PRS_v54_manteuffels_neutrality|PRS_v54_the_russian_party|PRS_v54_the_western_party') `
  -Available "date > 1854.4.1" `
  -Name 'The Treaty of 20 April' `
  -Desc 'Vienna proposes a defensive alliance: the two German powers would guarantee each other''s German territory and act together in the Principalities if Russia does not withdraw. Manteuffel wants a treaty that binds Austria without binding Prussia.' `
  -Reward @'
country_event = { id = v54_pru.54 }
'@

New-Focus -Id 'PRS_v54_the_frankfurt_diet' -Icon 'GFX_focus_bismarck' -X -22 -Y 2 -Cost 8 -Filters $POL -Hist -Ai 60 `
  -Pre @('PRS_v54_the_april_treaty|PRS_v54_manteuffels_neutrality') `
  -Available "date > 1854.7.1" `
  -Name 'The Federal Diet' `
  -Desc 'Austria asks the Confederation to endorse her Eastern policy and to prepare its contingents. Prussia''s young envoy in Frankfurt warns that the Confederation must not become Vienna''s army, and Berlin must decide how far to follow him.' `
  -Reward @'
country_event = { id = v54_pru.55 }
'@

New-Focus -Id 'PRS_v54_the_bamberg_states' -Icon 'GFX_focus_AUS_an_improved_german_state' -X -26 -Y 3 -Cost 8 -Filters $POL -Hist -Ai 50 `
  -Pre @('PRS_v54_the_frankfurt_diet') `
  -Available "date > 1854.11.1" `
  -Name 'The Bamberg Conference' `
  -Desc 'Bavaria, Saxony, Württemberg, Hesse and others meet at Bamberg and declare for Austria. A bloc of middle states under Vienna''s leadership is exactly what Prussian policy has tried to prevent since Olmütz.' `
  -Reward @'
country_event = { id = v54_pru.56 }
'@

New-Focus -Id 'PRS_v54_excluded_from_vienna' -Icon 'GFX_Focus_Break_Treaty' -X -22 -Y 3 -Cost 8 -Filters $POL -Ai 40 `
  -Pre @('PRS_v54_the_frankfurt_diet') `
  -Available "date > 1855.3.1" `
  -Name 'Excluded from Vienna' `
  -Desc 'The conferences at Vienna are held without Prussia. Neutrality has kept her out of the war and out of the councils of the great powers, and the King feels the slight more than his ministers do.' `
  -Reward @'
country_event = { id = v54_pru.57 }
'@

New-Focus -Id 'PRS_v54_admission_to_the_congress' -Icon 'GFX_goal_focus_prussia_paris_declaration' -X -24 -Y 4 -Cost 10 -Filters $POL -Hist -Ai 70 `
  -Pre @('PRS_v54_excluded_from_vienna|PRS_v54_the_bamberg_states') `
  -Available "has_global_flag = v54_crimean_war_ended" `
  -Name 'Admission to the Congress of Paris' `
  -Desc 'The victors agree, after some hesitation, to invite Prussia to sign the peace as one of the powers that signed the Treaty of Vienna of 1815. Manteuffel goes to Paris to sign a settlement he had no hand in making.' `
  -Reward @'
country_event = { id = v54_pru.58 }
'@

# ================================================================================================
# B. THE REACTION, THE COURT AND THE LANDTAG (x -17..-9, y 0..3)
# ================================================================================================
New-Focus -Id 'PRS_v54_the_manteuffel_ministry' -Icon 'GFX_Focus_Conservative_Constitution' -X -13 -Y 0 -Cost 5 -Filters $POL -Hist -Ai 90 `
  -Name 'The Manteuffel Ministry' `
  -Desc 'Otto von Manteuffel has governed Prussia since 1850 on the principle that the King rules and the ministers obey. The constitution of 1850 is kept in the letter and ignored in spirit, the Landtag is managed, and every liberal in the kingdom waits for the old King to die.' `
  -Reward @'
add_ideas = PRS_v54_idea_manteuffel_ministry
add_political_power = 50
'@

New-Focus -Id 'PRS_v54_legacy_of_olmutz' -Icon 'GFX_Focus_Army_Reactionary' -X -16 -Y 1 -Cost 8 -Filters $POL -Ai 60 `
  -Pre @('PRS_v54_the_manteuffel_ministry') `
  -Name 'The Legacy of Olmütz' `
  -Desc 'In 1850 Prussia gave way to Austrian demands rather than risk war over Hesse and the Union of Erfurt. Four years later the officers and the nationalists have not forgotten the retreat, and the ministers who signed it have not forgotten that they signed it.' `
  -Reward @'
add_ideas = PRS_v54_idea_olmutz_legacy
add_war_support = 0.02
'@

New-Focus -Id 'PRS_v54_the_herrenhaus' -Icon 'GFX_Focus_Convince_Conservatives' -X -10 -Y 1 -Cost 8 -Filters $POL -Hist -Ai 60 `
  -Pre @('PRS_v54_the_manteuffel_ministry') `
  -Available "date > 1854.9.1" `
  -Name 'The Herrenhaus' `
  -Desc 'The elected First Chamber is to be replaced by a House of Lords of hereditary and royal members. The conservatives see in it the pillar of the monarchy, the liberals the end of what remains of the constitution.' `
  -Reward @'
country_event = { id = v54_pru.60 }
'@

New-Focus -Id 'PRS_v54_the_kreuzzeitung_party' -Icon 'GFX_Focus_Anti_Liberalism' -X -16 -Y 2 -Cost 8 -Filters $POL -Ai 50 `
  -Pre @('PRS_v54_legacy_of_olmutz') -Mutex @('PRS_v54_the_wochenblatt_party') `
  -Name 'The Kreuzzeitung Party' `
  -Desc 'The King listens to Ernst Ludwig von Gerlach, to his brother the general-adjutant and to the writers of the Neue Preußische Zeitung. Church, Crown and a Christian state are their programme, and they regard Manteuffel as a bureaucrat and Bismarck as a useful man.' `
  -Reward @'
add_ideas = PRS_v54_idea_kreuzzeitung_camarilla
add_stability = 0.02
add_political_power = 25
'@

New-Focus -Id 'PRS_v54_the_wochenblatt_party' -Icon 'GFX_Focus_Ideology_Liberal_comprimise' -X -14 -Y 2 -Cost 8 -Filters $POL -Ai 25 `
  -Pre @('PRS_v54_legacy_of_olmutz') -Mutex @('PRS_v54_the_kreuzzeitung_party') `
  -Name 'The Wochenblatt Party' `
  -Desc 'Moritz August von Bethmann-Hollweg and the liberal conservatives of the Preußisches Wochenblatt want a strong state under law, an orderly Landtag and an understanding with Britain. They are loyal, educated and patient, and they have the Prince of Prussia''s ear.' `
  -Reward @'
add_ideas = PRS_v54_idea_wochenblatt_party
add_political_power = 25
'@

New-Focus -Id 'PRS_v54_police_and_censorship' -Icon 'GFX_Focus_Justice_police_force' -X -12 -Y 2 -Cost 8 -Filters $POL -Ai 50 `
  -Pre @('PRS_v54_the_manteuffel_ministry') `
  -Name 'Police and the Press' `
  -Desc 'Hinckeldey''s Berlin police and Stieber''s informants watch the clubs and the newspapers. Order is kept, and the memory of 1848 is kept alive on both sides of the watching.' `
  -Reward @'
add_stability = 0.03
add_political_power = -25
'@

New-Focus -Id 'PRS_v54_the_stiehl_regulations' -Icon 'GFX_focus_AFG_education_reform' -X -10 -Y 2 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('PRS_v54_the_manteuffel_ministry') `
  -Available "date > 1854.10.1" `
  -Name 'The Stiehl Regulations' `
  -Desc 'Ferdinand Stiehl''s regulations for the elementary schools put religion and the catechism at the centre of the curriculum and limit the teacher training colleges to the three Rs. The conservatives call it the cure for 1848, and the teachers call it something else.' `
  -Reward @'
add_stability = 0.02
add_political_power = 25
'@

New-Focus -Id 'PRS_v54_the_prince_of_prussia' -Icon 'GFX_Focus_Army_Conservative' -X -15 -Y 3 -Cost 8 -Filters $POL -Ai 40 `
  -Pre @('PRS_v54_the_kreuzzeitung_party|PRS_v54_the_wochenblatt_party') `
  -Name 'The Prince of Prussia' `
  -Desc 'Wilhelm, the King''s brother and heir presumptive, was the man who fled to London in 1848 and returned a soldier. He commands the Rhine army, dislikes the camarilla and distrusts the Western liberals, and he thinks about the army more than anything else.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_pru_prince_wilhelm_known
'@

New-Focus -Id 'PRS_v54_the_landtag_elections' -Icon 'GFX_focus_election_overlay_blue_1' -X -13 -Y 3 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('PRS_v54_the_manteuffel_ministry') `
  -Available "date > 1855.8.1" `
  -Name 'The Elections of 1855' `
  -Desc 'The Landtag is to be elected under the three-class franchise. The Eastern war has divided the conservatives, and the Landräte have been reminded which candidates the King prefers.' `
  -Reward @'
country_event = { id = v54_pru.61 }
'@

New-Focus -Id 'PRS_v54_the_kings_illness' -Icon 'GFX_Focus_BRA_crown' -X -11 -Y 3 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('PRS_v54_the_prince_of_prussia') `
  -Available "date > 1857.6.1" `
  -Name 'The King''s Illness' `
  -Desc 'Friedrich Wilhelm IV has suffered a stroke and his mind is no longer what it was. The court is divided about who should act in his name, and the army, the ministers and the liberals each have a candidate.' `
  -Reward @'
country_event = { id = v54_pru.62 }
'@

# ================================================================================================
# C. THE ZOLLVEREIN, RAILWAYS AND BANKS (x -8..-2, y 0..3)
# ================================================================================================
New-Focus -Id 'PRS_v54_the_zollverein_in_1854' -Icon 'GFX_focus_GER_customs_union' -X -5 -Y 0 -Cost 5 -Filters $IND -Ai 90 `
  -Name 'The Zollverein in 1854' `
  -Desc 'The customs union that Prussia founded in 1834 now covers nearly all of Germany outside Austria and the Hanseatic towns. It pays for itself, it binds the middle states to Berlin more firmly than any treaty, and Vienna has tried and failed to break it.' `
  -Reward @'
add_political_power = 25
'@

New-Focus -Id 'PRS_v54_hanover_joins' -Icon 'GFX_focus_zollverein_profits' -X -8 -Y 1 -Cost 8 -Filters $IND -Hist -Ai 60 `
  -Pre @('PRS_v54_the_zollverein_in_1854') `
  -Name 'Hanover Joins the Zollverein' `
  -Desc 'The Steuerverein of Hanover, Oldenburg and their neighbours has been dissolved and its members have entered the Zollverein. The north German coast is now inside the Prussian customs system, and the old rivalry between the two blocs is over.' `
  -Reward @'
country_event = { id = v54_pru.65 }
'@

New-Focus -Id 'PRS_v54_trade_treaty_with_austria' -Icon 'GFX_focus_AUH_encourage_trade_transport' -X -4 -Y 1 -Cost 8 -Filters $IND -Ai 50 `
  -Pre @('PRS_v54_the_zollverein_in_1854') `
  -Name 'The Trade Treaty with Austria' `
  -Desc 'The treaty of 1853 gave Austria a privileged tariff and Prussia a promise that Vienna would not insist on membership. It is a compromise that neither side loves and both can live with.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = economics_tech }
if = {
	limit = { country_exists = AUS }
	add_opinion_modifier = { target = AUS modifier = v54_om_trade_treaty }
	reverse_add_opinion_modifier = { target = AUS modifier = v54_om_trade_treaty }
}
'@

New-Focus -Id 'PRS_v54_railway_boom' -Icon 'GFX_goal_focus_prussian_state_rail' -X -8 -Y 2 -Cost 10 -Filters $IND -Hist -Ai 70 `
  -Pre @('PRS_v54_the_zollverein_in_1854') `
  -Name 'The Railway Boom' `
  -Desc 'Lines are being opened across Prussia as fast as the engineers can lay them. Berlin is joined to the Rhine, to Silesia and to the Baltic ports, and the locomotive works of Borsig and Egells cannot keep up with the orders.' `
  -Reward @'
add_tech_bonus = { bonus = 0.75 uses = 1 category = transport_tech }
add_ideas = PRS_v54_idea_railway_boom
'@

New-Focus -Id 'PRS_v54_berlin_banks' -Icon 'GFX_goal_focus_prussia_borse' -X -4 -Y 2 -Cost 8 -Filters $IND -Hist -Ai 50 `
  -Pre @('PRS_v54_the_zollverein_in_1854') `
  -Available "date > 1855.10.1" `
  -Name 'Banks for Berlin' `
  -Desc 'Joint-stock banks open in Berlin on the French model: the Berliner Handels-Gesellschaft, the Disconto-Gesellschaft''s expansion, and the Darmstädter Bank in the Rhine towns. Railways, mines and ironworks find the capital they need, and the Prussian bourse grows rich on their shares.' `
  -Reward @'
country_event = { id = v54_pru.66 }
'@

New-Focus -Id 'PRS_v54_the_ruhr_and_silesia' -Icon 'GFX_goal_focus_prussia_silesian_steel' -X -6 -Y 3 -Cost 10 -Filters $IND -Ai 50 `
  -Pre @('PRS_v54_railway_boom') `
  -Name 'The Ruhr and Silesia' `
  -Desc 'Coal and iron in Westphalia and Upper Silesia are the foundation of Prussian power. New pits and ironworks are opened every year, supported by railways, German engineers and a growing army of workers from the countryside.' `
  -Reward @'
57 = { add_building_construction = { type = infrastructure level = 1 instant_build = yes } }
67 = { add_building_construction = { type = infrastructure level = 1 instant_build = yes } }
add_ideas = PRS_v54_idea_ruhr_and_silesia
'@

New-Focus -Id 'PRS_v54_the_jade_treaty' -Icon 'GFX_goal_generic_construct_naval_dockyard' -X -2 -Y 3 -Cost 8 -Filters $IND -Ai 40 `
  -Pre @('PRS_v54_berlin_banks|PRS_v54_the_zollverein_in_1854') `
  -Name 'The Jade Treaty' `
  -Desc 'In 1853 Oldenburg ceded a strip of the Jade Bight to Prussia for a naval harbour on the North Sea. The land is a marsh, and Prince Adalbert sees in it the future of the Prussian fleet.' `
  -Reward @'
add_ideas = PRS_v54_idea_jade_bight
'@

# ================================================================================================
# D. THE ARMY AND THE FLEET (x -27..-19, y 8..11)
# ================================================================================================
New-Focus -Id 'PRS_v54_the_army_in_1854' -Icon 'GFX_goal_focus_prussian_victorian_army' -X -23 -Y 8 -Cost 5 -Filters $MIL -Ai 90 `
  -Name 'The Prussian Army in 1854' `
  -Desc 'The army that stood down at Olmütz and enforced order in Baden is a conscript force with a small cadre and a large Landwehr. The King distrusts the Landwehr, the Prince of Prussia distrusts the liberals, and the budget has not changed in a decade.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_pru_army_focus_started
'@

New-Focus -Id 'PRS_v54_partial_mobilisation' -Icon 'GFX_Focus_Army_Timeplan_Mobilisation' -X -26 -Y 9 -Cost 10 -Filters $MIL -Ai 40 `
  -Pre @('PRS_v54_the_army_in_1854') `
  -Available "date > 1854.4.1" `
  -Name 'Partial Mobilisation' `
  -Desc 'Several corps are placed on a war footing along the eastern frontier and in Silesia. The King does not intend to fight; he wishes to be taken seriously by Vienna and Petersburg. The cost is paid in gold and in the patience of the reservists.' `
  -Reward @'
set_temp_variable = { money_to_gain = -1 }
add_money_with_tooltip_effect = yes
add_manpower = 20000
add_war_support = 0.03
add_ideas = PRS_v54_idea_partial_mobilisation
'@

New-Focus -Id 'PRS_v54_the_needle_gun' -Icon 'GFX_goal_focus_prussia_dreyse_rifle' -X -24 -Y 9 -Cost 10 -Filters $MIL -Hist -Ai 60 `
  -Pre @('PRS_v54_the_army_in_1854') `
  -Name 'The Needle Gun' `
  -Desc 'Dreyse''s breech-loading Zündnadelgewehr has been in service since 1841, and by the 1850s most of the line infantry carry it. No other army has anything like it, and the Prussian General Staff is only beginning to understand what it means for tactics.' `
  -Reward @'
add_tech_bonus = { ahead_reduction = 1 uses = 1 category = rifle_equipment_techs }
'@

New-Focus -Id 'PRS_v54_the_general_staff_under_reyher' -Icon 'GFX_Focus_Army_Prussian_Staff' -X -22 -Y 9 -Cost 10 -Filters $MIL -Ai 40 `
  -Pre @('PRS_v54_the_army_in_1854') `
  -Name 'The General Staff under Reyher' `
  -Desc 'General von Reyher, the Chief of the General Staff, is a careful and conservative officer who keeps the plans up to date and the railways surveyed. The Staff has not yet become what it will be, but the habits that will make it are in place.' `
  -Reward @'
add_ideas = PRS_v54_idea_general_staff_habits
'@

New-Focus -Id 'PRS_v54_the_landwehr_question' -Icon 'GFX_focus_BAD_Landwehr' -X -20 -Y 9 -Cost 8 -Filters $MIL -Ai 30 `
  -Pre @('PRS_v54_the_army_in_1854') `
  -Name 'The Landwehr Question' `
  -Desc 'The Landwehr, the citizen reserve created in 1813, is the army''s second line and the liberals'' favourite. The King and the Prince of Prussia want it reduced; its supporters say that it is the nation in arms. The argument will come to a head in the next reign.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_pru_landwehr_debate
'@

New-Focus -Id 'PRS_v54_roons_memoranda' -Icon 'GFX_goal_focus_prussia_war_ministers' -X -26 -Y 10 -Cost 10 -Filters $MIL -Hist -Ai 50 `
  -Pre @('PRS_v54_the_landwehr_question|PRS_v54_the_general_staff_under_reyher') `
  -Available "date > 1856.1.1" `
  -Name 'Roon''s Memoranda' `
  -Desc 'Colonel Albrecht von Roon, geographer, soldier and devout Lutheran, has written a series of papers on how the army ought to be organised: a longer term of service, a stronger line and a Landwehr kept in the second rank. They are not for publication.' `
  -Reward @'
country_event = { id = v54_pru.69 }
'@

New-Focus -Id 'PRS_v54_moltke_chief_of_staff' -Icon 'GFX_goal_focus_prussia_von_moltke' -X -22 -Y 10 -Cost 10 -Filters $MIL -Hist -Ai 60 `
  -Pre @('PRS_v54_the_general_staff_under_reyher') `
  -Available "date > 1857.8.1" `
  -Name 'A New Chief of the General Staff' `
  -Desc 'Reyher has died and the King must name a successor. Helmuth von Moltke, who has served in Turkey and as adjutant to Prince Friedrich Wilhelm, is the candidate of the younger officers; the court would prefer someone less clever.' `
  -Reward @'
country_event = { id = v54_pru.68 }
'@

New-Focus -Id 'PRS_v54_prince_adalberts_fleet' -Icon 'GFX_goal_generic_construct_naval_dockyard' -X -24 -Y 11 -Cost 10 -Filters $MIL -Ai 40 `
  -Pre @('PRS_v54_the_army_in_1854') `
  -Name 'Prince Adalbert''s Fleet' `
  -Desc 'Prince Adalbert, the King''s cousin, commands the small Prussian navy: a few sailing frigates, a number of gunboats and the hopes of every patriot who looks at the Baltic. The Jade Bight is the next step, and the King is not sure he wants to pay for it.' `
  -Reward @'
add_ideas = PRS_v54_idea_adalbert_fleet
'@

# ================================================================================================
# E. PRUSSIA IN GERMANY (x -17..-9, y 8..11)
# ================================================================================================
New-Focus -Id 'PRS_v54_prussia_in_the_confederation' -Icon 'GFX_goal_focus_prussia_reform' -X -13 -Y 8 -Cost 5 -Filters $POL -Ai 90 `
  -Name 'Prussia in the Confederation' `
  -Desc 'Austria holds the presidency of the German Confederation and the middle states look to Vienna. Prussia has the Zollverein, the army and the north, and the memory of Olmütz. The Federal Diet in Frankfurt is where the two powers measure each other every day.' `
  -Reward @'
add_political_power = 25
'@

New-Focus -Id 'PRS_v54_bismarck_in_frankfurt' -Icon 'GFX_focus_bismarck' -X -16 -Y 9 -Cost 8 -Filters $POL -Hist -Ai 60 `
  -Pre @('PRS_v54_prussia_in_the_confederation') `
  -Name 'Bismarck in Frankfurt' `
  -Desc 'The envoy to the Federal Diet, a Pomeranian Junker of thirty-nine, has gone to Frankfurt as an admirer of Austria and is learning that Austria treats Prussia as a junior partner. His dispatches are brilliant, frank and unwelcome, and Manteuffel does not know what to do with him.' `
  -Reward @'
country_event = { id = v54_pru.70 }
'@

New-Focus -Id 'PRS_v54_the_middle_states' -Icon 'GFX_focus_AUS_an_improved_german_state' -X -14 -Y 9 -Cost 8 -Filters $POL -Ai 40 `
  -Pre @('PRS_v54_prussia_in_the_confederation') `
  -Name 'The Middle States' `
  -Desc 'Bavaria, Saxony, Württemberg and Hanover want to preserve their independence of both great powers and are happiest when the two cancel each other out. Prussia cannot win them against Austria, but it can make them less certain of Vienna.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_pru_middle_state_policy
'@

New-Focus -Id 'PRS_v54_the_gotha_liberals' -Icon 'GFX_Focus_Ideology_Support_Liberalism' -X -12 -Y 9 -Cost 8 -Filters $POL -Ai 25 `
  -Pre @('PRS_v54_prussia_in_the_confederation') `
  -Name 'The Gotha Liberals' `
  -Desc 'The men of the Union of Erfurt, defeated in 1850, have not given up their plan for a lesser Germany under the Hohenzollerns. They meet at Gotha, publish in the Grenzboten and wait for a Prussian government that wants what they want.' `
  -Reward @'
add_political_power = 25
set_country_flag = v54_pru_gotha_liberals
'@

New-Focus -Id 'PRS_v54_the_duchies_question' -Icon 'GFX_focus_DEN_schleswigian_farmers' -X -10 -Y 9 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('PRS_v54_prussia_in_the_confederation') `
  -Available "date > 1855.9.1" `
  -Name 'The Duchies Question' `
  -Desc 'Copenhagen has promulgated a common constitution for the Kingdom and the duchies, and German opinion in Holstein and the Confederation reacts angrily. The London Protocol of 1852, which Prussia signed, has settled the succession; it has not settled the argument.' `
  -Reward @'
country_event = { id = v54_pru.72 }
'@

New-Focus -Id 'PRS_v54_the_english_marriage' -Icon 'GFX_Focus_Royal_Marriage' -X -12 -Y 10 -Cost 8 -Filters $POL -Hist -Ai 40 `
  -Pre @('PRS_v54_the_prince_of_prussia|PRS_v54_the_gotha_liberals') `
  -Available "date > 1855.9.1" `
  -Name 'A Match with England' `
  -Desc 'Prince Friedrich Wilhelm, the Prince of Prussia''s son, has gone to Balmoral and come back engaged to Victoria, the Princess Royal. The liberals are delighted, the camarilla is not, and Queen Victoria has expectations of what the match will do for Germany.' `
  -Reward @'
country_event = { id = v54_pru.85 }
'@

New-Focus -Id 'PRS_v54_the_neuchatel_crisis' -Icon 'GFX_focus_generic_befriend_switzerland' -X -14 -Y 10 -Cost 8 -Filters $POL -Hist -Ai 60 `
  -Pre @('PRS_v54_prussia_in_the_confederation') `
  -Available "date > 1856.8.1" `
  -Name 'The Neuchâtel Crisis' `
  -Desc 'The King of Prussia is also, by an old arrangement, Prince of Neuchâtel, a Swiss canton that has been a republic since 1848. A royalist rising has failed, the Swiss hold the prisoners, and Berlin has to decide how far to go for a principality that nobody in Prussia really wants.' `
  -Reward @'
country_event = { id = v54_pru.80 }
'@

$ids = Write-FocusFiles 'prussia' "# Victorian 1854-1900 project: Prussian opening branch 1854-1857 (generated by tools/gen_prussia_1854.ps1).`n# Included in the tree prussia_focus by a marked block in common/national_focus/prussia_focus.txt.`n# Layout: x -27..-2, y 0..11, left of the upstream tree (which starts at x = 0)." 'Prussian opening branch 1854-1857'
Patch-TreeInclude 'common/national_focus/prussia_focus.txt' $ids 'prussian 1854 opening branch'
"{0} focuses written; tree include patched" -f $ids.Count
