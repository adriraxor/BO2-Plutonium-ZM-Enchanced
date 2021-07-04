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
#include RaxorPlugin\functions;

//Preprocessor definition chaining
#define WELCOME_MSG = BASE_MSG + PROJECT_TITLE;

//Preprocessor global definitions
#define BASE_MSG = "RaxorPlugin | Project for server";
#define PROJECT_TITLE = "RaxorPlugin";

//Preprocessor directives
#ifdef RELEASE
    #define BUILD = "DevBuild 1.0a";
#else
    #ifndef DEBUG
        #define BUILD = "Build type not set";
    #else
    #define BUILD = "DevBuild 1.0a";
    #endif
#endif

init()
{
    level thread onPlayerConnect();
    //level thread removeSkyBarrier();
    //level thread deathBarrier();
    drawCustomHUD();
    
}

onPlayerConnect()
{
    self freezecontrols(false);
    
    for(;;)
    {
        level waittill("connected", player);
        if(player IsHost()){
            player.status = "Host";
            } else {
            player.status = "Unverified";
        }
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
    i = 0;
    self endon("disconnect");
    level endon("game_ended");
    for(;;)
    {
        self waittill("spawned_player");
        if(isDefined(self.playerSpawned))
            continue;
        self.playerSpawned = true;
        
        wait 3;
        // Message qui appara?t lors du spawn d'un joueur pendant un certains temps'
        self iprintln(BUILD);
        self iprintln(WELCOME_MSG);
        
        wait 3;
        self check_owner();
        
        wait 3;
      
        level thread set_perk_limit(9);
        self health(150);
        ScoreP(1000);
        wait 2;
        self iprintln("^1[^6RaxorPlugin^1] ^7Bienvenue sur le serveur !");
        wait 2;
        self iprintln("^1[^6RaxorPlugin^1] ^7Serveur creer par Adriraxor !");
        wait 2;
        self iprintln("^1[^6RaxorPlugin^1] ^7Plugin creer par Adriraxor");
        wait 2;
        self iprintln("^1[^6RaxorPlugin^1] ^7Nombres d'atouts possibles : ", level.perk_purchase_limit);
        wait 2;
        self iprintln("^1[^6RaxorPlugin^1] ^7Killstreak actif");
        wait 2;
        self iprintln("^1[^6RaxorPlugin^1] ^7SkyBarrier supprimer");
        wait 2;
        self iprintln("^1[^6RaxorPlugin^1] ^7DeathBarrier supprimer");
        wait 2;
        self iprintln("^1[^6RaxorPlugin^1] ^7Bonne chance !");
        wait 2;
        self iprintln("^2PlayerName ^7 ^5", self.name);
        wait 2;
        
        while(i < 1000000000){
            i += 1;
            self killstreaks_reward();
            wait 0.02;
        }
    }
}

