/obj/item/bio_chip/tracking
	name = "tracking bio-chip"
	desc = "Track with this."
	activated = BIOCHIP_ACTIVATED_PASSIVE
	origin_tech = "materials=2;magnets=2;programming=2;biotech=2"
	implant_data = /datum/implant_fluff/tracking
	implant_state = "implant-nanotrasen"
	var/warn_cooldown = 0
	var/obj/item/gps/internal_gps
	var/internal_gps_path = /obj/item/gps/internal/tracking_implant

/obj/item/bio_chip/tracking/Initialize(mapload)
	. = ..()
	GLOB.tracked_implants += src

/obj/item/bio_chip/tracking/Destroy()
	QDEL_NULL(internal_gps)
	GLOB.tracked_implants -= src
	return ..()

/obj/item/bio_chip/tracking/implant(mob/target)
	. = ..()
	if(!.)
		return
	internal_gps = new internal_gps_path(src)

/obj/item/bio_chip/tracking/removed(mob/target)
	. = ..()
	if(.)
		QDEL_NULL(internal_gps)

/obj/item/gps/internal/tracking_implant
	gpstag = "TRACK0"
	local = FALSE

/obj/item/bio_chip_implanter/tracking
	name = "bio-chip implanter (tracking)"
	implant_type = /obj/item/bio_chip/tracking

/obj/item/bio_chip_case/tracking
	name = "bio-chip case - 'Tracking'"
	desc = "A glass case containing a tracking bio-chip."
	implant_type = /obj/item/bio_chip/tracking
