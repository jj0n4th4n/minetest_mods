-- I didn't added any of the mushrooms because they are better drawn as nodeboxes which isn't supported by this model

-- Support to the flowers mod(usually packed with the MTG):
if minetest.get_modpath("flowers") then
	local flowers_flowers = {
			{"flowers:rose"					, "rose"				, "rose"				, 1	, "flowers_rose.png" },
			{"flowers:dandelion_white"		, "dandelion_white"		, "white dandelion"		, 1	, "flowers_dandelion_white.png" },
			{"flowers:dandelion_yellow"		, "dandelion_yellow"	, "yellow dandelion"	, 1	, "flowers_dandelion_yellow.png" },
			{"flowers:geranium"				, "geranium"			, "geranium"			, 1	, "flowers_geranium.png" },
			{"flowers:tulip"				, "tulip"				, "tulip" 				, 1	, "flowers_tulip.png" },
			{"flowers:viola"				, "viola"				, "viola"				, 1	, "flowers_viola.png" },
			{"flowers:chrysanthemum_green"	, "chrysanthemum_green"	, "green chrysanthemum"	, 1	, "flowers_chrysanthemum_green.png" },
			{"flowers:tulip_black"			, "tulip_black"			, "black tulip"			, 1	, "flowers_tulip_black.png" }
	}

	for i in pairs(flowers_flowers) do
		table.insert(interior_decor.flowers, flowers_flowers[i])
	end
else
	local rose1 = {
			{"interior_decor:rose"			, "rose"				, "rose"				, 1	, "interior_decor_flower_pot_rose_1.png" },
	}
	table.insert(interior_decor.flowers, rose1[1])
end

-- Support to the default ferns:
if minetest.get_modpath("default") then
	local flowers_default = {
			{"default:fern_1"				, "fern"				, "fern"				, 1	, "default_fern_1.png" },
			{"default:fern_2"				, "fern"				, "fern"				, 2	, "default_fern_2.png" },
			{"default:fern_3"				, "fern"				, "fern"				, 3	, "default_fern_3.png" },
	}
	for i in pairs(flowers_default) do
		table.insert(interior_decor.flowers, flowers_default[i])
	end
end
			
-- Support to the beautiflowers mod:
if minetest.get_modpath("beautiflowers") then
	local flowers_flowers = {
			{"beautiflowers:bonsai_1"		, "bonsai"				, "green bonsai"		, 1	, "bonsai_1.png" },
			{"beautiflowers:bonsai_2"		, "bonsai"				, "brown bonsai"		, 2	, "bonsai_2.png" },
			{"beautiflowers:bonsai_3"		, "bonsai"				, "green bonsai"		, 3	, "bonsai_3.png" },
			{"beautiflowers:bonsai_4"		, "bonsai"				, "brown bonsai"		, 4	, "bonsai_4.png" },
			{"beautiflowers:bonsai_5"		, "bonsai"				, "dark green bonsai"	, 5	, "bonsai_5.png" },
			{"beautiflowers:arcoiris"		, "arcoiris"			, "arcoiris"			, 1	, "arcoiris.png" },
			{"beautiflowers:ada"			, "ada"					, "ada"					, 1	, "ada.png"		 },
			{"beautiflowers:agnes"			, "agnes"				, "agnes"				, 1	, "agnes.png" 	 },
			{"beautiflowers:alicia"			, "alicia"				, "alicia"				, 1	, "alicia.png"	 },
			{"beautiflowers:alma"			, "alma"				, "alma"				, 1	, "alma.png" 	 },
			{"beautiflowers:amaia"			, "amaia"				, "amaia"				, 1	, "amaia.png"	 },
			{"beautiflowers:any"			, "any"					, "any"					, 1	, "any.png" 	 },
			{"beautiflowers:anastasia"		, "anastasia"			, "anastasia"			, 1	, "anastasia.png"},
			{"beautiflowers:astrid"			, "astrid"				, "astrid"				, 1	, "astrid.png"},
			{"beautiflowers:beatriz"		, "beatriz"				, "beatriz"				, 1	, "beatriz.png"},
			{"beautiflowers:belen"			, "belen"				, "belen"				, 1	, "belen.png"},
			{"beautiflowers:berta"			, "berta"				, "berta"				, 1	, "berta.png"},
			{"beautiflowers:blanca"			, "blanca"				, "blanca"				, 1	, "blanca.png"},
			{"beautiflowers:carla"			, "carla"				, "carla"				, 1	, "carla.png"},
			{"beautiflowers:casandra"		, "casandra"			, "casandra"			, 1	, "casandra.png"},
			{"beautiflowers:clara"			, "clara"				, "clara"				, 1	, "clara.png"},
			{"beautiflowers:claudia"		, "claudia"				, "claudia"				, 1	, "claudia.png"},
			{"beautiflowers:cloe"			, "cloe"				, "cloe"				, 1	, "cloe.png"},
			{"beautiflowers:cristina"		, "cristina"			, "cristina"			, 1	, "cristina.png"},
			{"beautiflowers:dafne"			, "dafne"				, "dafne"				, 1	, "dafne.png"},
			{"beautiflowers:dana"			, "dana"				, "dana"				, 1	, "dana.png"},
			{"beautiflowers:delia"			, "delia"				, "delia"				, 1	, "delia.png"},
			{"beautiflowers:elena"			, "elena"				, "elena"				, 1	, "elena.png"},
			{"beautiflowers:erica"			, "erica"				, "erica"				, 1	, "erica.png"},
			{"beautiflowers:estela"			, "estela"				, "estela"				, 1	, "estela.png"},
			{"beautiflowers:eva"			, "eva"					, "eva"					, 1	, "eva.png"},
			{"beautiflowers:fabiola"		, "fabiola"				, "fabiola"				, 1	, "fabiola.png"},
			{"beautiflowers:fiona"			, "fiona"				, "fiona"				, 1	, "fiona.png"},
			{"beautiflowers:gala"			, "gala"				, "gala"				, 1	, "gala.png"},
			{"beautiflowers:gisela"			, "gisela"				, "gisela"				, 1	, "gisela.png"},
			{"beautiflowers:gloria"			, "gloria"				, "gloria"				, 1	, "gloria.png"},
			{"beautiflowers:irene"			, "irene"				, "irene"				, 1	, "irene.png"},
			{"beautiflowers:ingrid"			, "ingrid"				, "ingrid"				, 1	, "ingrid.png"},
			{"beautiflowers:iris"			, "iris"				, "iris"				, 1	, "iris.png"},
			{"beautiflowers:ivette"			, "ivette"				, "ivette"				, 1	, "ivette.png"},
			{"beautiflowers:jennifer"		, "jennifer"			, "jennifer"			, 1	, "jennifer.png"},
			{"beautiflowers:lara"			, "lara"				, "lara"				, 1	, "lara.png"},
			{"beautiflowers:laura"			, "laura"				, "laura"				, 1	, "laura.png"},
			{"beautiflowers:lidia"			, "lidia"				, "lidia"				, 1	, "lidia.png"},
			{"beautiflowers:lucia"			, "lucia"				, "lucia"				, 1	, "lucia.png"},
			{"beautiflowers:mara"			, "mara"				, "mara"				, 1	, "mara.png"},
			{"beautiflowers:martina"		, "martina"				, "martina"				, 1	, "martina.png"},
			{"beautiflowers:melania"		, "melania"				, "melania"				, 1	, "melania.png"},
			{"beautiflowers:mireia"			, "mireia"				, "mireia"				, 1	, "mireia.png"},
			{"beautiflowers:nadia"			, "nadia"				, "nadia"				, 1	, "nadia.png"},
			{"beautiflowers:nerea"			, "nerea"				, "nerea"				, 1	, "nerea.png"},
			{"beautiflowers:noelia"			, "noelia"				, "noelia"				, 1	, "noelia.png"},
			{"beautiflowers:noemi"			, "noemi"				, "noemi"				, 1	, "noemi.png"},
			{"beautiflowers:olimpia"		, "olimpia"				, "olimpia"				, 1	, "olimpia.png"},
			{"beautiflowers:oriana"			, "oriana"				, "oriana"				, 1	, "oriana.png"},
			{"beautiflowers:pia"			, "pia"					, "pia"					, 1	, "pia.png"},
			{"beautiflowers:raquel"			, "raquel"				, "raquel"				, 1	, "raquel.png"},
			{"beautiflowers:ruth"			, "ruth"				, "ruth"				, 1	, "ruth.png"},
			{"beautiflowers:sandra"			, "sandra"				, "sandra"				, 1	, "sandra.png"},
			{"beautiflowers:sara"			, "sara"				, "sara"				, 1	, "sara.png"},
			{"beautiflowers:silvia"			, "silvia"				, "silvia"				, 1	, "silvia.png"},
			{"beautiflowers:sofia"			, "sofia"				, "sofia"				, 1	, "sofia.png"},
			{"beautiflowers:sonia"			, "sonia"				, "sonia"				, 1	, "sonia.png"},
			{"beautiflowers:talia"			, "talia"				, "talia"				, 1	, "talia.png"},
			{"beautiflowers:thais"			, "thais"				, "thais"				, 1	, "thais.png"},
			{"beautiflowers:valeria"		, "valeria"				, "valeria"				, 1	, "valeria.png"},
			{"beautiflowers:valentina"		, "valentina"			, "valentina"			, 1	, "valentina.png"},
			{"beautiflowers:vanesa"			, "vanesa"				, "vanesa"				, 1	, "vanesa.png"},
			{"beautiflowers:vera"			, "vera"				, "vera"				, 1	, "vera.png"},
			{"beautiflowers:victoria"		, "victoria"			, "victoria"			, 1	, "victoria.png"},
			{"beautiflowers:virginia"		, "virginia"			, "virginia"			, 1	, "virginia.png"},
			{"beautiflowers:xena"			, "xena"				, "xena"				, 1	, "xena.png"},			
			{"beautiflowers:xenia"			, "xenia"				, "xenia"				, 1	, "xenia.png"},
			{"beautiflowers:zaida"			, "zaida"				, "zaida"				, 1	, "zaida.png"},
			{"beautiflowers:nazareth"		, "nazareth"			, "nazareth"			, 1	, "nazareth.png"},
			{"beautiflowers:arleth"			, "arleth"				, "arleth"				, 1	, "arleth.png"},
			{"beautiflowers:miriam"			, "miriam"				, "miriam"				, 1	, "miriam.png"},
			{"beautiflowers:minerva"		, "minerva"				, "minerva"				, 1	, "minerva.png"},
			{"beautiflowers:sabrina"		, "sabrina"				, "sabrina"				, 1	, "sabrina.png"},
			{"beautiflowers:rocio"			, "rocio"				, "rocio"				, 1	, "rocio.png"},
			{"beautiflowers:regina"			, "regina"				, "regina"				, 1	, "regina.png"},
			{"beautiflowers:paula"			, "paula"				, "paula"				, 1	, "paula.png"},
			{"beautiflowers:olga"			, "olga"				, "olga"				, 1	, "olga.png"},
			{"beautiflowers:diana"			, "diana"				, "diana"				, 1	, "diana.png"},
			{"beautiflowers:michelle"		, "michelle"			, "michelle"			, 1	, "michelle.png"},
			{"beautiflowers:genesis"		, "genesis"				, "genesis"				, 1	, "genesis.png"},
			{"beautiflowers:hadassa"		, "hadassa"				, "hadassa"				, 1	, "hadassa.png"},
			{"beautiflowers:suri"			, "suri"				, "suri"				, 1	, "suri.png"},
	}
	for i in pairs(flowers_flowers) do
		table.insert(interior_decor.flowers, flowers_flowers[i])
	end
end

-- Support to the ferns mod:
if minetest.get_modpath("ferns") then
	local flowers_ferns = {
			{"ferns:horsetail_01"			, "horsetail_01"		, "horsetail stage 1"	, 1	, "ferns_horsetail_01.png" },
			{"ferns:horsetail_02"			, "horsetail_02"		, "horsetail stage 2"	, 2	, "ferns_horsetail_02.png" },
			{"ferns:horsetail_03"			, "horsetail_03"		, "horsetail stage 3"	, 3	, "ferns_horsetail_03.png" },
			{"ferns:horsetail_04"			, "horsetail_04"		, "horsetail stage 4"	, 3	, "ferns_horsetail_04.png" },
	}
	for i in pairs(flowers_ferns) do
		table.insert(interior_decor.flowers, flowers_ferns[i])
	end
end

-- Support to the herbs mod:
if minetest.get_modpath("herbs") then
	local flowers_herbs = {
			{"herbs:campanula_blue"			, "campanula_blue"		, "blue campanula"		, 1	, "herbs_campanula_blue.png" },
			{"herbs:clover_red"				, "clover_red"			, "red clover"			, 1	, "herbs_clover_red.png" },
			{"herbs:clover_white"			, "clover_white"		, "white clover"		, 1	, "herbs_clover_white.png" },
			{"herbs:cornflower"				, "cornflower"			, "cornflower"			, 1	, "herbs_cornflower.png" },
			{"herbs:houndstooth"			, "houndstooth"			, "houndstooth"			, 1	, "herbs_houndstooth.png" },
			{"herbs:iris"					, "iris"				, "iris"				, 1	, "herbs_iris.png" },
			{"herbs:margerit"				, "margerit"			, "margerit"			, 1	, "herbs_margerit.png" },
			{"herbs:noble_white"			, "noble_white"			, "white noble"			, 1	, "herbs_noble_white.png" },
			{"herbs:poppy_red"				, "poppy_red"			, "red poppy"			, 1	, "herbs_poppy_red.png" },
			{"herbs:ribwort"				, "ribwort"				, "ribwort"				, 1	, "herbs_ribwort.png" },
			{"herbs:snapdragon"				, "snapdragon"			, "snapdragon"			, 1	, "herbs_snapdragon.png" },
			{"herbs:sundew"					, "sundew"				, "sundew"				, 1	, "herbs_sundew.png" },
			{"herbs:thimble_blue"			, "thimble_blue"		, "blue thimble"		, 1	, "herbs_thimble_blue.png" },
			{"herbs:thimble_yellow"			, "thimble_yellow"		, "yellow thimble"		, 1	, "herbs_thimble_yellow.png" },
			{"herbs:yarrow_white"			, "yarrow_white"		, "white yarrow"		, 1	, "herbs_yarrow_white.png" },
	}
	for i in pairs(flowers_herbs) do
		table.insert(interior_decor.flowers, flowers_herbs[i])
	end
end

-- Support to the moreplants mod:
if minetest.get_modpath("moreplants") then
	local flowers_mplants = {
			{"moreplants:bigflower"			, "bigflower"			, "big flower"			, 1	, "moreplants_bigflower.png" },
			{"moreplants:blueflower"		, "blueflower"			, "blue flower"			, 1	, "moreplants_blueflower.png" },
			{"moreplants:bluespike"			, "bluespike"			, "blue spike"			, 1	, "moreplants_bluespike.png" },
			{"moreplants:bush"				, "bush"				, "bush"				, 1	, "moreplants_bush.png" },
			{"moreplants:taigabush"			, "taigabush"			, "taiga bush"			, 1	, "moreplants_tundrabush.png" },
			{"moreplants:caveflower"		, "caveflower"			, "cave flower"			, 1	, "moreplants_cavefung.png" },
			{"moreplants:clover"			, "clover"				, "clover"				, 1	, "moreplants_clover.png" },
			{"moreplants:curly"				, "curly"				, "curly"				, 1	, "moreplants_curly.png" },
			{"moreplants:fireflower"		, "fireflower"			, "fire flower"			, 1	, "moreplants_fireflower.png" },
			{"moreplants:jungleflower"		, "jungleflower"		, "jungle flower"		, 1	, "moreplants_jungleflower1.png" },
			{"moreplants:medflower"			, "medflower"			, "med flower"			, 1	, "moreplants_medflower.png" },
			{"moreplants:moonflower"		, "moonflower"			, "moon flower"			, 1	, "moreplants_moonflower.png" },
			{"moreplants:pinkflower"		, "pinkflower"			, "pink flower"			, 1	, "moreplants_pinkflower.png" },
			{"moreplants:pinkflower2"		, "pinkflower2"			, "pink plant"			, 1	, "moreplants_pink.png" },
			{"moreplants:bigfern"			, "bigfern"				, "big fern"			, 1	, "moreplants_bigfern.png" },
			{"moreplants:cavefern"			, "cavefern"			, "cave fern"			, 1	, "moreplants_cavefern.png" },
			{"moreplants:fern"				, "fern"				, "fern"				, 1	, "moreplants_fern.png" },
			{"moreplants:spikefern"			, "spikefern"			, "spike fern"			, 1	, "moreplants_spikefern.png" },
			{"moreplants:grass"				, "grass"				, "grass"				, 1	, "moreplants_grass.png" },
			{"moreplants:tallgrass"			, "grass"				, "grass"				, 2	, "moreplants_longgrass.png" },
			{"moreplants:stoneweed"			, "stoneweed"			, "stone weed"			, 1	, "moreplants_stoneplant.png" },
			{"moreplants:weed"				, "weed"				, "weed"				, 1	, "moreplants_weed.png" },
	}
	for i in pairs(flowers_mplants) do
		table.insert(interior_decor.flowers, flowers_mplants[i])
	end
end





