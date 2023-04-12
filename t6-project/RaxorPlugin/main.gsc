/*
    *   Script created by Adriraxor for Call of Duty : Black ops 2 ZM  - Steam/Plutonium    * 
*
*    Project : RaxorPlugin
*    Author : Adriraxor
*    Game : Call of Duty: Black Ops 2
*    Description : Main class ! C'est ici que le code s'?x?cute en premier !  
*    Date : 04/07/2021 06:53:38
*
*/

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\zombies\_zm_spawner;
#include maps\mp\zombies\_zm_playerhealth;

get_zombieskilled()
{
	return level.zombie_player_killed_count;
}

get_playerhealth()
{
	return self.health;
}

killstreaks_reward(p_getPrestige)
{
	killstreak_player = self.kills;

	prestige1  = randomintrange(150, 350);
	prestige2  = randomintrange(350, 450);
	prestige3  = randomintrange(450, 550);
	prestige4  = randomintrange(550, 650);
	prestige5  = randomintrange(650, 750);
	prestige6  = randomintrange(750, 850);
	prestige7  = randomintrange(850, 950);
	prestige8  = randomintrange(950, 1000);
	prestige9  = randomintrange(1000, 1050);
	prestige10 = randomintrange(1050, 1150);
	prestige11 = randomintrange(1500, 2000);
	
	p_boolPrestige1 = false;
	p_boolPrestige2 = false;
	p_boolPrestige3 = false;
	p_boolPrestige4 = false;
	p_boolPrestige5 = false;
	p_boolPrestige6 = false;
	p_boolPrestige7 = false;
	p_boolPrestige8 = false;
	p_boolPrestige9 = false;
	p_boolPrestige10 = false;
	p_boolPrestige11 = false;

	if(killstreak_player == 50) {
		
		if(p_getPrestige != 1 && !p_boolPrestige1){
			self.score = self.score + prestige1;
			self iprintln("^5[Prestige 1] Vous venez de gagner " + prestige1 + "$");
		}
		self.prestige settext("Prestige : ^31");
		p_boolPrestige1 = true;		
		p_getPrestige = 1;
		
		return p_getPrestige;
		
		} else if(killstreak_player == 100) {
		
			if(p_getPrestige != 2 && !p_boolPrestige2){
				self.score = self.score + prestige2;
				self iprintln("^5[Prestige 2] Vous venez de gagner " + prestige2 + "$");
			}
			self.prestige settext("Prestige : ^32");
			p_boolPrestige2 = true;
			p_getPrestige = 2;
			
			return p_getPrestige;
	
			} else if(killstreak_player == 150){
				
				if(p_getPrestige != 3 && !p_boolPrestige3){
					self.score = self.score + prestige3;
					self iprintln("^5[Prestige 3] Vous venez de gagner " + prestige3 + "$");
				}
				
				p_boolPrestige3 = true;
				p_getPrestige = 3;

				return p_getPrestige;

				} else if(killstreak_player == 250){
					
					if(p_getPrestige != 4 && !p_boolPrestige4){
						self.score = self.score + prestige4;
						self iprintln("^5[Prestige 4] Vous venez de gagner " + prestige4 + "$");
					}
					
					p_getPrestige = 4;
					p_boolPrestige4 = true;
					
					return p_getPrestige;
					
					} else if(killstreak_player == 350) {
						if(p_getPrestige != 5 && !p_boolPrestige5){
							self.score = self.score + prestige5;
							self iprintln("^5[Prestige 5] Vous venez de gagner " + prestige5 + "$");
						}

						p_getPrestige = 5;
						p_boolPrestige5 = true;
						
						return p_getPrestige;

						} else if(killstreak_player == 450){
							
							if(p_getPrestige != 6 && !p_boolPrestige6){
								self.score = self.score + prestige6;
								self iprintln("^5[Prestige 6] Vous venez de gagner " + prestige6 + "$");
							}
							
							p_getPrestige = 6;
							p_boolPrestige6 = true;

							return p_getPrestige;
							
							}else if(killstreak_player == 550){
								
								if(p_getPrestige != 7 && !p_boolPrestige7){
									self.score = self.score + prestige7;
									self iprintln("^5[Prestige 7] Vous venez de gagner " + prestige7 + "$");
								}
								
								p_getPrestige = 7;
								p_boolPrestige7 = true;

								return p_getPrestige;
								
								}else if(killstreak_player == 650){
									
									if(p_getPrestige != 8 && !p_boolPrestige8){
										self.score = self.score + prestige8;
										self iprintln("^5[Prestige 8] Vous venez de gagner " + prestige8 + "$");
									}
									
									p_getPrestige = 8;
									p_boolPrestige8 = true;
									
									return p_getPrestige;

									}else if(killstreak_player == 750){
										
										if(p_getPrestige != 9 && !p_boolPrestige9){
											self.score = self.score + prestige9;
											self iprintln("^5[Prestige 9] Vous venez de gagner " + prestige9 + "$");
										}

										p_getPrestige = 9;
										p_boolPrestige9 = true;

										return p_getPrestige;
										
										}else if(killstreak_player == 850){
											
											if(p_getPrestige != 10 && !p_boolPrestige10){
												self.score = self.score + prestige10;
												self iprintln("^5[Prestige 10] Vous venez de gagner " + prestige10 + "$");
											}
											
											p_getPrestige = 10;
											p_boolPrestige10 = true;

											return p_getPrestige;
											
											}else if(killstreak_player >= 1200){
												
												if(p_getPrestige != 11 && !p_boolPrestige11){
													self.score = self.score + prestige11;
													self iprintln("^5[Maitre Prestige] Vous gagnez " + prestige11 + "$ toutes les 2 minutes !");
												}
												
												p_getPrestige = 11;
												p_boolPrestige11 = true;

												return p_getPrestige;
												
												}
}

check_owner()
{
	if(self.name == "Adriraxor")
	{
		self iprintln("^2Attention ! Le chef est sur le serveur ! ^3~ ^1Adriraxor ^3~");
		wait(5);
	}
}

set_perk_limit(num)
{
	level.perk_purchase_limit = num;
}

health(number)
{
	self.health = number;
	self.maxhealth = number;
}

scorep(number)
{
    self.score+=number;
    self iprintln("^1[^6RaxorPlugin^1]^7 Le serveur vous fait cadeau de : ^2", number, "^7 points");
}

drawcustomhud()
{
    //Nombres de zombies restants
    level.zombiesCountDisplay = createServerFontString("Objective" , 1.6);
    level.zombiesCountDisplay setPoint("CENTER", "TOP", 0, "CENTER");
    
    //Nombres de zombies tu?s 
    level.zombiesCountKilledDisplay = createServerFontString("Objective", 1.4);
    level.zombiesCountKilledDisplay setPoint("LEFT", "TOP", 200, "LEFT");
   
    thread updateCustomHUD();
}

recreatecustomhud()
{
	level notify("stopUpdatingZombiesCounter");
	thread updatecustomhud();
}


updatecustomhud()
{
    level endon("stopUpdatingZombiesCounter");

    while(true)
    {
        zombiesCount  = get_current_zombie_count(); //Zombies restants
        zombiesKilled = get_zombiesKilled(); //Zombies tu?s
        level.zombiesCountKilledDisplay SetText("Zombies Tues: ^2" + zombiesKilled); //Zombies tu?s
        
        //Zombies restants
        if(zombiesCount >= 10){
            level.zombiesCountDisplay SetText("Zombies restants: ^1" + zombiesCount);
            wait 2;
            } else if (zombiesCount >= 5) {
                level.zombiesCountDisplay SetText("Zombies restants: ^3" + zombiesCount);
                wait 2;
                } else if (zombiesCount <= 4){
                    level.zombiesCountDisplay SetText("Zombies restants: ^2" + zombiesCount);
                    wait 2;
                }
                waitForCustomHUDChanged("stopUpdatingZombiesCounter");
    }
}

waitforcustomhudchanged(endonnotification)
{
    level endon(endonNotification);
    
    oldZombiesCount       = get_current_zombie_count();
    
    oldZombiesKilledCount = get_zombiesKilled(); 
   
    while(true)
    {
        newZombiesCount       = get_current_zombie_count();
        newZombiesKilledCount = get_zombiesKilled();
       
        if(oldZombiesKilledCount != newZombiesKilledCount)
        {
            return;
        }
        
        if(oldZombiesCount != newZombiesCount)
        {
            return;
        }
        
        wait 1;
    }
}

removeskybarrier()
{
	entarray = getentarray();
	for(index = 0; index < entarray.size; index++)
	{
		if(issubstr(entarray[index].classname, "trigger_hurt") && entarray[index].origin[2] > 180)
		{
			entarray[index].origin = (0, 0, 9999999);
		}
	}
}

deathbarrier()
{
	ents = getentarray();
	for(index = 0; index < ents.size; index++)
	{
		if(issubstr(ents[index].classname, "trigger_hurt"))
		{
			ents[index].origin = (0, 0, 9999999);
		}
	}
}

init_player_hitmarkers()
{
    self.hud_damagefeedback = newdamageindicatorhudelem( self );
    self.hud_damagefeedback.horzalign = "center";
    self.hud_damagefeedback.vertalign = "middle";
    self.hud_damagefeedback.x = -12;
    self.hud_damagefeedback.y = -12;
    self.hud_damagefeedback.alpha = 0;
    self.hud_damagefeedback.archived = 1;
    self.hud_damagefeedback.color = ( 1, 1, 1 );
    self.hud_damagefeedback setshader( "damage_feedback", 20, 40 );
    self.hitsoundtracker = 1;
    self.hud_damagefeedback_red = newdamageindicatorhudelem( self );
    self.hud_damagefeedback_red.horzalign = "center";
    self.hud_damagefeedback_red.vertalign = "middle";
    self.hud_damagefeedback_red.x = -12;
    self.hud_damagefeedback_red.y = -12;
    self.hud_damagefeedback_red.alpha = 0;
    self.hud_damagefeedback_red.archived = 1;
    self.hud_damagefeedback_red.color = ( 1, 0, 0 );
    self.hud_damagefeedback_red setshader( "damage_feedback", 20, 40 );
}


updatedamagefeedback( mod, inflictor, death )
{
	if (!isplayer(self) || isDefined(self.disable_hitmarkers)) return;
	if (isDefined(mod) && mod != "MOD_CRUSH" && mod != "MOD_GRENADE_SPLASH" && mod != "MOD_HIT_BY_OBJECT")
	{
		if (isDefined(inflictor))
		{
			self playlocalsound("mpl_hit_alert");
		}
		if(death && level.redHM)
		{
    		self.hud_damagefeedback_red setshader("damage_feedback", 20, 40);
			self.hud_damagefeedback_red.alpha = 1;
			self.hud_damagefeedback_red fadeovertime(1);
			self.hud_damagefeedback_red.alpha = 0;
		} else {
        	self.hud_damagefeedback setshader("damage_feedback", 20, 40);
			self.hud_damagefeedback.alpha = 1;
			self.hud_damagefeedback fadeovertime(1);
			self.hud_damagefeedback.alpha = 0;
		}
	}
    return 0;
}

do_hitmarker_death()
{
	if (isDefined(self.attacker) && isplayer(self.attacker) && self.attacker != self)
    {
		self.attacker thread updatedamagefeedback(self.damagemod, self.attacker, 1);
    }
    return 0;
}

do_hitmarker(mod, hitloc, hitorig, player, damage)
{
    if (isDefined(player) && isplayer(player) && player != self)
    {
		player thread updatedamagefeedback(mod, player, 0);
    }
    return 0;
}

init()
{
	precacheshader("damage_feedback");

    maps/mp/zombies/_zm_spawner::register_zombie_damage_callback(::do_hitmarker);
    maps/mp/zombies/_zm_spawner::register_zombie_death_event_callback(::do_hitmarker_death);
	
	level thread onplayerconnect();
	level thread removeskybarrier();
	level thread deathbarrier();

    level.redHm = getDvarIntDefault( "redHitmarkers", 0 );

	drawcustomhud();
}

onplayerconnect()
{
	self freezecontrols(false);
    
    for(;;)
    {
        level waittill("connected", player);
		if (!isDefined(player.hud_damagefeedback))
        {
            player thread init_player_hitmarkers();
        }
        if(player IsHost()){
            player.status = "Host";
            } else {
            player.status = "Unverified";
        }
        player thread onPlayerSpawned();
    }
}

onplayerspawned()
{
	init_prestige = 0;

	self endon("disconnect");
	level endon("game_ended");
	for(;;)
	{
		self waittill("spawned_player");

        if(isDefined(self.playerSpawned))
            continue;
        self.playerSpawned = true;
		
		wait 3;
		
		self.welcometext = self createfontstring("Objective", 2);
		self.welcometext setpoint("CENTER", "CENTER", "CENTER", "CENTER");
		self.welcometext settext("^1Bienvenue ^2", self.name);
		
		self.prestige = self createfontstring("Objective", 1.4);
		self.prestige setpoint("RIGHT", "TOP", -200 , "RIGHT");

		wait 2;
		
		self.welcometext settext("");
		self check_owner();
		
		wait 3;
		
		level thread set_perk_limit(9);
		
		self health(150);
		
		self iprintln("^1[^6RaxorPlugin^1] ^7Serveur creer par Adriraxor !");
		wait 0.5;
		self iprintln("^1[^6RaxorPlugin^1] ^7Plugin creer par Adriraxor");
		wait 0.5;
		self iprintln("^1[^6RaxorPlugin^1] ^7Nombres d'atouts possibles : ", level.perk_purchase_limit);
		wait 0.5;
		self iprintln("^1[^6RaxorPlugin^1] ^7Killstreak ~Prestige~: actif");
		wait 0.5;
		self iprintln("^1[^6RaxorPlugin^1] ^7SkyBarrier supprimer");
		wait 0.5;
		self iprintln("^1[^6RaxorPlugin^1] ^7DeathBarrier supprimer");
		wait 0.5;
		self iprintln("^1[^6RaxorPlugin^1] ^7Bonne chance !");
		wait 0.5;
		
		scorep(randomintrange(200, 2000));
		
		for(;;)
		{
			p_prestige = killstreaks_reward(p_prestige);
			wait(0.02);
		}
	}
}