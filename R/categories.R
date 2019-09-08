# Date: December 11, 2015
rm(list=ls())
setwd("~/Documents/GitHub/ZSR_lb_data/")

# loz
# The Legend of Zelda
loz.category <- c("1st-quest", "2nd-quest")
loz.category_names <- c("1st Quest", "2nd Quest")

# aol
# Adventure of Link
aol.category <- c("deathless", "100-all-keys", "100-deathless", "any")
aol.category_names <- c("Deathless", "100% All Keys", "100% Deathless", "Any%")

# alttp
# A Link to the Past
alttp.category <- c("no-major-glitches", "any", "100", "no-eg", "all-dungeons", "no-oob")
alttp.category_names <- c("No Major Glitches", "Any%", "100%", "No Exploration Glitch", "All Dungeons", "No Out of Bounds")

# la
# Link's Awakening
la.category <- c("warpless", "any")
la.category_names <- c("Warpless", "Any%")

# oot
# Ocarina of Time
oot.category <- c("any", "100", "all-dungeons", "mst", "no-rba-no-ww", "no-ww", "glitchless100", "glitchless", "ganonless", "no-rba-no-ww-new")
oot.category_names <- c("Any%", "100%", "All Dungeons", "Medallions/Stones/Trials", "No IM/WW", "No Wrong Warp", "Glitchless 100%", "Glitchless", "Ganonless", "No RBA/WW")

# ladx
# Link's Awakening DX
ladx.category <- c("no-sq", "100", "any", "no-ww-oob", "allinstruments") 
ladx.category_names <- c("Any% (No WW, No OoB, No S+Q)", "100%", "Any%", "Any% (No WW, No OoB)", "Any% (All Instruments)")

# mm
# Majora's Mask
mm.category <- c("any", "100", "allmasks", "glitchless")
mm.category_names <- c("Any%", "100%", "All Masks", "Glitchless")

# oos
# Oracle of Seasons
oos.category <- c("any")
oos.category_names <- c("Any%")

# ooa
# Oracle of Ages
ooa.category <- c("any")
ooa.category_names <- c("Any%")

# ootmq
# Ocarina of Time MQ
ootmq.category <- c("100", "ad", "no-rba-no-ww")
ootmq.category_names <- c("100%", "All Dungeons", "No RBA/WW")

# tww
# The Wind Waker
tww.category <- c("any", "100", "glitchless")
tww.category_names <- c("Any%", "100%", "Glitchless")

# fsa
# Four Swords Adventures
fsa.category <- c("any")
fsa.category_names <- c("Any%")

# tmc
# The Minish Cap
tmc.category <- c("any", "100")
tmc.category_names <- c("Any%", "100%")

# tp
# Twilight Princess
tp.category <- c("any", "100", "any-no-sq", "alldungeons")
tp.category_names <- c("Any%", "100%", "Any% (No Save+Quit)", "All Dungeons")

# ph
# Phantom Hourglass
ph.category <- c("any")
ph.category_names <- c("Any%")

# st
# Spirit Tracks
st.category <- c("any")
st.category_names <- c("Any%")

# oot3d
# Ocarina of Time 3D
oot3d.category <- c("any", "100", "any-ngp", "mst")
oot3d.category_names <- c("Any%", "100%", "Any% NG+", "Medallions/Stones/Trials")

# ss
# Skyward Sword
ss.category <- c("any", "100")
ss.category_names <- c("Any%", "100%")

# twwhd
# The Wind Waker HD
twwhd.category <- c("any", "100", "glitchless")
twwhd.category_names <- c("Any%", "100%", "Glitchless")

# albw
# A Link Between Worlds
albw.category <- c("any", "100", "glitchless")
albw.category_names <- c("Any%", "100%", "Glitchless")

# mm3d
# Majora's Mask 3D
mm3d.category <- c("100", "any", "allmasks")
mm3d.category_names <- c("100%", "Any%", "All Masks")

category_url <- c(albw.category, alttp.category, aol.category, fsa.category,
                la.category, ladx.category, loz.category, mm.category, mm3d.category,
                ooa.category, oos.category, oot.category, oot3d.category, ootmq.category,
                ph.category, ss.category, st.category, tmc.category, tp.category,
                tww.category, twwhd.category)

category <- c(albw.category_names, alttp.category_names, aol.category_names,
              fsa.category_names, la.category_names, ladx.category_names, 
              loz.category_names, mm.category_names, mm3d.category_names,
              ooa.category_names, oos.category_names, oot.category_names, 
              oot3d.category_names, ootmq.category_names, ph.category_names,
              ss.category_names, st.category_names, tmc.category_names, tp.category_names,
              tww.category_names, twwhd.category_names)

game_url <- c(rep("albw", length(albw.category)), rep("alttp", length(alttp.category)), 
              rep("aol", length(aol.category)), rep("fsa", length(fsa.category)),
              rep("la", length(la.category)), rep("ladx", length(ladx.category)),
              rep("loz", length(loz.category)), rep("mm", length(mm.category)),
              rep("mm3d", length(mm3d.category)), rep("ooa", length(ooa.category)),
              rep("oos", length(oos.category)), rep("oot", length(oot.category)),
              rep("oot3d", length(oot3d.category)), rep("ootmq", length(ootmq.category)),
              rep("ph", length(ph.category)), rep("ss", length(ss.category)), 
              rep("st", length(st.category)), rep("tmc", length(tmc.category)),
              rep("tp", length(tp.category)), rep("tww", length(tww.category)),
              rep("twwhd", length(twwhd.category)))

game_names <- c(rep("A Link Between Worlds", length(albw.category)), rep("A Link to the Past", length(alttp.category)), 
                rep("Adventure of Link", length(aol.category)), rep("Four Swords Adventures", length(fsa.category)),
                rep("Link's Awakening", length(la.category)), rep("Link's Awakening DX", length(ladx.category)),
                rep("The Legend of Zelda", length(loz.category)), rep("Majora's Mask", length(mm.category)),
                rep("Majora's Mask 3D", length(mm3d.category)), rep("Oracle of Ages", length(ooa.category)),
                rep("Oracle of Seasons", length(oos.category)), rep("Ocarina of Time", length(oot.category)),
                rep("Ocarina of Time 3D", length(oot3d.category)), rep("Ocarina of Time MQ", length(ootmq.category)),
                rep("Phantom Hourglass", length(ph.category)), rep("Skyward Sword", length(ss.category)), 
                rep("Spirit Tracks", length(st.category)), rep("The Minish Cap", length(tmc.category)),
                rep("Twilight Princess", length(tp.category)), rep("The Wind Waker", length(tww.category)),
                rep("The Wind Waker HD", length(twwhd.category)))

category <- c(category)
category_url <- c(category_url)
category_table <- data.frame(Category=category, Game=game_names, 
                             Category_URL=category_url, Game_URL=game_url)

save(category_table, file="Data/category_table.Rdata")
