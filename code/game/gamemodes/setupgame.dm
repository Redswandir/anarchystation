/proc/setupgenetics()
//	if (prob(50))
//		BLOCKADD = rand(-300,300)
//	if (prob(75))
//		DIFFMUT = rand(0,20)

	var/list/avnums = new /list(DNA_STRUC_ENZYMES_BLOCKS)
	for(var/i=1, i<=DNA_STRUC_ENZYMES_BLOCKS, i++)
		avnums[i] = i
	
	HULKBLOCK = pick_n_take(avnums)
	TELEBLOCK = pick_n_take(avnums)
	
	FIREBLOCK = pick_n_take(avnums)
	XRAYBLOCK = pick_n_take(avnums)
	
	CLUMSYBLOCK = pick_n_take(avnums)
	STRANGEBLOCK = pick_n_take(avnums)
	DEAFBLOCK = pick_n_take(avnums)
	BLINDBLOCK = pick_n_take(avnums)
	NEARSIGHTEDBLOCK = pick_n_take(avnums)
	EPILEPSYBLOCK = pick_n_take(avnums)
	COUGHBLOCK = pick_n_take(avnums)
	TOURETTESBLOCK = pick_n_take(avnums)
	NERVOUSBLOCK = pick_n_take(avnums)
	RACEBLOCK = pick_n_take(avnums)

	bad_se_blocks = list(NEARSIGHTEDBLOCK,EPILEPSYBLOCK,STRANGEBLOCK,COUGHBLOCK,CLUMSYBLOCK,TOURETTESBLOCK,NERVOUSBLOCK,DEAFBLOCK,BLINDBLOCK)
	good_se_blocks = list(FIREBLOCK,XRAYBLOCK)
	op_se_blocks = list(HULKBLOCK,TELEBLOCK)
	
	NULLED_SE = repeat_string(DNA_STRUC_ENZYMES_BLOCKS, repeat_string(DNA_BLOCK_SIZE, "_"))
	NULLED_UI = repeat_string(DNA_UNI_IDENTITY_BLOCKS, repeat_string(DNA_BLOCK_SIZE, "_"))
	// HIDDEN MUTATIONS / SUPERPOWERS INITIALIZTION

/*
	for(var/x in typesof(/datum/mutations) - /datum/mutations)
		var/datum/mutations/mut = new x

		for(var/i = 1, i <= mut.required, i++)
			var/datum/mutationreq/require = new/datum/mutationreq
			require.block = rand(1, 13)
			require.subblock = rand(1, 3)

			// Create random requirement identification
			require.reqID = pick("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", \
							 "B", "C", "D", "E", "F")

			mut.requirements += require


		global_mutations += mut// add to global mutations list!
*/


/proc/setupfactions()

	// Populate the factions list:
	for(var/x in typesof(/datum/faction))
		var/datum/faction/F = new x
		if(!F.name)
			del(F)
			continue
		else
			ticker.factions.Add(F)
			ticker.availablefactions.Add(F)

	// Populate the syndicate coalition:
	for(var/datum/faction/syndicate/S in ticker.factions)
		ticker.syndicate_coalition.Add(S)


/* This was used for something before, I think, but is not worth the effort to process now.
/proc/setupcorpses()
	for (var/obj/effect/landmark/A in landmarks_list)
		if (A.name == "Corpse")
			var/mob/living/carbon/human/M = new /mob/living/carbon/human(A.loc)
			M.real_name = "Corpse"
			M.death()
			del(A)
			continue
		if (A.name == "Corpse-Engineer")
			var/mob/living/carbon/human/M = new /mob/living/carbon/human(A.loc)
			M.real_name = "Corpse"
			M.death()
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_eng(M), slot_ears)
			M.equip_to_slot_or_del(new /obj/item/device/pda/engineering(M), slot_belt)
			M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/engineer(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/orange(M), slot_shoes)
		//	M.equip_to_slot_or_del(new /obj/item/weapon/storage/toolbox/mechanical(M), slot_l_hand)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/device/t_scanner(M), slot_r_store)
			//M.equip_to_slot_or_del(new /obj/item/device/radio/headset(M), slot_ears)
			M.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(M), slot_back)
			if (prob(50))
				M.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(M), slot_wear_mask)
			if (prob(50))
				M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/hardhat(M), slot_head)
			else
				if (prob(50))
					M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/welding(M), slot_head)
			del(A)
			continue
		if (A.name == "Corpse-Engineer-Space")
			var/mob/living/carbon/human/M = new /mob/living/carbon/human(A.loc)
			M.real_name = "Corpse"
			M.death()
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_eng(M), slot_ears)
			M.equip_to_slot_or_del(new /obj/item/weapon/tank/emergency_oxygen(M), slot_belt)
			M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/engineer(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/orange(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/suit/space(M), slot_wear_suit)
		//	M.equip_to_slot_or_del(new /obj/item/weapon/storage/toolbox/mechanical(M), slot_l_hand)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/device/t_scanner(M), slot_r_store)
			M.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(M), slot_back)
			M.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(M), slot_wear_mask)
			if (prob(50))
				M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/hardhat(M), slot_head)
			else
				if (prob(50))
					M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/welding(M), slot_head)
				else
					M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space(M), slot_head)
			del(A)
			continue
		if (A.name == "Corpse-Engineer-Chief")
			var/mob/living/carbon/human/M = new /mob/living/carbon/human(A.loc)
			M.real_name = "Corpse"
			M.death()
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_eng(M), slot_ears)
			M.equip_to_slot_or_del(new /obj/item/weapon/storage/utilitybelt(M), slot_belt)
			M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/chief_engineer(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/orange(M), slot_shoes)
		//	M.equip_to_slot_or_del(new /obj/item/weapon/storage/toolbox/mechanical(M), slot_l_hand)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/device/t_scanner(M), slot_r_store)
			M.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(M), slot_back)
			if (prob(50))
				M.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(M), slot_wear_mask)
			if (prob(50))
				M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/hardhat(M), slot_head)
			else
				if (prob(50))
					M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/welding(M), slot_head)
			del(A)
			continue
		if (A.name == "Corpse-Syndicate")
			var/mob/living/carbon/human/M = new /mob/living/carbon/human(A.loc)
			M.real_name = "Corpse"
			M.death()
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset(M), slot_ears)
			//M.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver(M), slot_belt)
			M.equip_to_slot_or_del(new /obj/item/clothing/under/syndicate(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/swat(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/weapon/tank/jetpack(M), slot_back)
			M.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(M), slot_wear_mask)
			if (prob(50))
				M.equip_to_slot_or_del(new /obj/item/clothing/suit/space/syndicate(M), slot_wear_suit)
				if (prob(50))
					M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/swat(M), slot_head)
				else
					M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/syndicate(M), slot_head)
			else
				M.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(M), slot_wear_suit)
				M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/swat(M), slot_head)
			del(A)
			continue
*/
