/*
*    Infinity Loader :: The Best GSC IDE!
*
*    Project : RaxorPlugin
*    Author : Adriraxor
*    Game : Call of Duty: Black Ops 2
*    Description : Starts Zombies code execution!
*    Date : 15/07/2024 17:25:31
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
#include maps\mp\zombies\_zm_score;

get_zombieskilled()
{
    return level.zombie_player_killed_count;
}

get_playerhealth()
{
    return self.health;
}

killstreaks_reward()
{
    killstreak_player = self.kills;

    milestone1  = randomintrange(150, 350);
    milestone2  = randomintrange(350, 450);
    milestone3  = randomintrange(450, 550);
    milestone4  = randomintrange(550, 650);
    milestone5  = randomintrange(650, 750);
    milestone6  = randomintrange(750, 850);
    milestone7  = randomintrange(850, 950);
    milestone8  = randomintrange(950, 1000);
    milestone9  = randomintrange(1000, 1050);
    milestone10 = randomintrange(1050, 1150);
    milestone11 = randomintrange(1500, 2000);
        
    switch(killstreak_player){
        case 1:
            
            self.p_milestone = 1;
        
            if(self.p_milestone != 1){
                self.score = self.score + milestone1;
                self iprintln("^5[Milestone 1] Vous venez de gagner " + milestone1 + "$");
                update_milestone();
            }
            
            break;
            
        case 5:
            self.p_milestone = 2;
            
            if(self.p_milestone != 2){
                self.score = self.score + milestone2;
                self iprintln("^5[Milestone 2] Vous venez de gagner " + milestone2 + "$");
                update_milestone();
            }

            break;
        
        case 10:
                       
            self.p_milestone = 3;
            
            if(self.p_milestone != 3){
                self.score = self.score + milestone3;
                self iprintln("^5[Milestone 3] Vous venez de gagner " + milestone3 + "$");
                update_milestone();
            }
 
            break;
        
        case 15: 
            
            self.p_milestone = 4;
        
            if(self.p_milestone != 4){
                self.score = self.score + milestone4;
                self iprintln("^5[Milestone 4] Vous venez de gagner " + milestone4 + "$");
                update_milestone();
            }
            
            break;
        
        case 20:
            self.p_milestone = 5;
            
            if(self.p_milestone != 5){
                self.score = self.score + milestone5;
                self iprintln("^5[Milestone 5] Vous venez de gagner " + milestone5 + "$");
                update_milestone();
            }

            break;
        
        case 25:
                    
            self.p_milestone = 6;
            
            if(self.p_milestone != 6){
                self.score = self.score + milestone6;
                self iprintln("^5[Milestone 6] Vous venez de gagner " + milestone6 + "$");
                update_milestone();
            }

            
            break;
        
        case 30:
                    
            self.p_milestone = 7;
            
            if(self.p_milestone != 7){
                self.score = self.score + milestone7;
                self iprintln("^5[Milestone 7] Vous venez de gagner " + milestone7 + "$");
                update_milestone();
            }


            break;
            
        case 35:
            self.p_milestone = 8;
                    
            if(self.p_milestone != 8){
                self.score = self.score + milestone8;
                self iprintln("^5[Milestone 8] Vous venez de gagner " + milestone8 + "$");
                update_milestone();
            }

            break;
        
        case 750:
            self.p_milestone = 9;
            
            if(self.p_milestone != 9){
                self.score = self.score + milestone9;
                self iprintln("^5[Milestone 9] Vous venez de gagner " + milestone9 + "$");
                update_milestone();
            }
            
            break;
        
        case 850:
            self.p_milestone = 10;
            
            if(self.p_milestone != 10){
                self.score = self.score + milestone10;
                self iprintln("^5[Milestone 10] Vous venez de gagner " + milestone10 + "$");
                update_milestone();
            }

            break;
        
        default: 
            
            if(self.p_milestone != 11 && killstreak_player >= 1200){
                self.p_milestone = 11;
                
                self.score = self.score + milestone11;
                self iprintln("^5[Maitre milestone] Vous gagnez " + milestone11 + "$ toutes les 2 minutes !");
                
                update_milestone();
                  
            }
            
            break;
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
    
    level.zombiesCountDisplay = createServerFontString("Objective" , 1.3);
    level.zombiesCountDisplay setPoint("CENTER", "TOP", 0, "CENTER");
    
    level.zombiesCountKilledDisplay = createServerFontString("Objective", 1.0);
    level.zombiesCountKilledDisplay setPoint("LEFT", "TOP", 200, "LEFT");
    
    thread updateCustomHUD();
}

getShaderByMilestone(){
    
    switch(self.p_milestone){
        case 1:
            return "zombies_rank_1";
        
        case 2:
            return "zombies_rank_2";
        
        case 3:
            return "zombies_rank_3";
            
        case 4: 
            return "aar_icons_bullets_fired";
           
        case 5: 
            return "zombies_rank_4";
           
        case 6: 
            return "zombies_rank_4_ded";
        
        case 7:
            return "zombies_rank_5";
            
        case 8: 
            return "zombies_rank_5_ded";
            
        default: 
            break;
    }
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
        zombiesCount  = get_current_zombie_count(); 
        zombiesKilled = get_zombiesKilled(); 
        
        level.zombiesCountKilledDisplay SetText("Zombies Tues: ^2" + zombiesKilled);
        
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
    
    self.hud_damagefeedback_red           = newdamageindicatorhudelem( self );
    self.hud_damagefeedback_red.horzalign = "center";
    self.hud_damagefeedback_red.vertalign = "middle";
    self.hud_damagefeedback_red.x         = -12;
    self.hud_damagefeedback_red.y         = -12;
    self.hud_damagefeedback_red.alpha     = 0;
    self.hud_damagefeedback_red.archived  = 1;
    self.hud_damagefeedback_red.color     = ( 1, 0, 0 );
    self.hud_damagefeedback_red setshader( "damage_feedback", 20, 40 );
}

init_player_score_on_death()
{
    self.hud_score_on_death           = createServerFontString("Objective", 1.2);
    self.hud_score_on_death.horzalign = "center";
    self.hud_score_on_death.vertalign = "middle";
    self.hud_score_on_death.x         = 30;
    self.hud_score_on_death.y         = -12;
    self.hud_score_on_death.alpha     = 0;
    self.hud_score_on_death.archived  = 1;
    self.hud_score_on_death.color     = ( 1, 0, 0 );
}

init_player_milestone()
{
    //--- Milestone TEXT
    
    self.milestone = self createfontstring("Objective", 1.4);
    self.milestone setpoint("TOPCENTER", "TOPCENTER", 0 , 120);
    self.milestone.alpha = 0;
    
    //--- Milestone SHADER
    
    self.milestone_icon = self createservericon("zombies_rank_1", 60, 60);
    self.milestone_icon setpoint("TOPCENTER", "TOPCENTER", 0, 50);
    self.milestone_icon.alpha = 0;
    
}

update_milestone()
{
    
    self playlocalsound("nuke");

    self.milestone settext("Milestone ^3", self.p_milestone);  
    self.milestone.alpha = 1;
    self.milestone fadeovertime(5);
    self.milestone.alpha = 0;
    
    self.milestone_icon setshader(getShaderByMilestone(), 40, 40);
    self.milestone_icon.alpha = 1; 
    self.milestone_icon fadeovertime(5);
    self.milestone_icon.alpha = 0;
    
    
}

updatedamagefeedback( mod, inflictor, death )
{   
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

pop_score_on_death(mod, inflictor, death){
    if (isDefined(mod) && mod != "MOD_CRUSH" && mod != "MOD_GRENADE_SPLASH" && mod != "MOD_HIT_BY_OBJECT"){
        
        self.hud_score_on_death settext("+ 100");
        self.hud_score_on_death.alpha = 1;        
        self.hud_score_on_death fadeovertime(1);
        self.hud_score_on_death.alpha = 0;
    
    }
}

death_event()
{ 
    if (isDefined(self.attacker) && isplayer(self.attacker) && self.attacker != self)
    {
        self.attacker thread updatedamagefeedback(self.damagemod, self.attacker, 1);
        self.attacker thread pop_score_on_death(self.damagemod, self.attacker);
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

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

init()
{
    //--- precaches 
    
    precacheshader("damage_feedback");
    precacheshader("aar_icons_bullets_fired");
    precacheshader("zombies_rank_1");
    precacheshader("zombies_rank_2");
    precacheshader("zombies_rank_3");
    precacheshader("zombies_rank_4");
    precacheshader("zombies_rank_4_ded");
    precacheshader("zombies_rank_5");
    
    //--- register 
    
    register_zombie_damage_callback(::do_hitmarker);
    register_zombie_death_event_callback(::death_event);
    
    //--- others 
    
    level.start_weapon = "python_zm";
    
    //--- func init 
    
    level thread onplayerconnect();
    level thread removeskybarrier();
    level thread deathbarrier();
    
    //--- dvars 
    
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
            player thread init_player_score_on_death();
            
        }
        
        player thread init_player_milestone();
        
        if(player IsHost()){
            player.status = "Host";
            } else {
            player.status = "Unverified";
        }
        
        player thread onPlayerSpawned();
    }
}

logDebug()
{
    for(;;){
        
        self iprintln("CORPSES COUNT => ^5", get_current_corpse_count());
        self iprintln("ROUND CHANGE SPEED => ^5", level.speed_change_round);
        self iprintln("milestone => ^5", self.p_milestone);
        self iprintln("milestone SHADERS ^5", getShaderByMilestone());
        
        wait 1;
    }
}


onplayerspawned()
{
    self.p_milestone      = 0;
    self.currentmilestone = 0;
    
    self endon("disconnect");
    level endon("game_ended");
    
    self waittill("spawned_player");
        
    wait 3;
    
    self.welcometext = self createfontstring("Objective", 2);
    self.welcometext setpoint("CENTER", "CENTER", "CENTER", "CENTER");
    self.welcometext settext("^1Bienvenue ^2", self.name);

    wait 2;
    
    self.welcometext settext("");
    self check_owner();
    
    wait 3;
    
    self health(150);
    level thread set_perk_limit(11);
    
    self iprintln("^1[^6RaxorPlugin^1] ^7Serveur creer par Adriraxor !");
    wait 0.5;
    self iprintln("^1[^6RaxorPlugin^1] ^7Plugin creer par Adriraxor");
    wait 0.5;
    self iprintln("^1[^6RaxorPlugin^1] ^7Nombres d'atouts possibles : ", level.perk_purchase_limit);
    wait 0.5;
    self iprintln("^1[^6RaxorPlugin^1] ^7Killstreak ~milestone~: actif");
    wait 0.5;
    self iprintln("^1[^6RaxorPlugin^1] ^7SkyBarrier supprimer");
    wait 0.5;
    self iprintln("^1[^6RaxorPlugin^1] ^7DeathBarrier supprimer");
    wait 0.5;
    self iprintln("^1[^6RaxorPlugin^1] ^7Bonne chance !");
    wait 0.5;
    
    thread logDebug();
    
    scorep(randomintrange(200, 2000));
    //thread scorep(100000);
    
    for(;;)
    {       
        killstreaks_reward();
        self.milestone_icon seticonshader(getShaderByMilestone());
        wait(0.02);
    }
    
}