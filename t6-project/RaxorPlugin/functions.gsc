/*
    *   Script created by Adriraxor for Call of Duty : Black ops 2 ZM  - Steam/Plutonium    * 
*       
*    Project : RaxorPlugin
*    Author : Adriraxor
*    Game : Call of Duty: Black Ops 2
*    Description : Only Functions class
*    Date : 04/07/2021 07:22:19
*
*/


/////////////////////
//Classes Fonctions//
/////////////////////

///////////
//Getters//
/////////// 
get_zombiesKilled()
{
   return level.total_zombies_killed;      
}

get_playerHealth()
{
    return self.health;
}

/*/
* S?rie de kills r?compens? par de l'argent
* Des d?fis seront disponible dans le futur et seront ?ditable ! 
/*/
killstreaks_reward()
{    
    killstreak_player = self.kills; //Variable ou on stocke la s?rie du joueur
    
    prestige1  = 200;   // default == 50 kills -> 100$
    prestige2  = 250;   // default == 100 kills -> 150$
    prestige3  = 300;   // default == 150 kills -> 200$
    prestige4  = 350;   // default == 200 kills -> 250$
    prestige5  = 400;   // default == 250 kills -> 300$
    prestige6  = 450;   // default == 300 kills -> 350$
    prestige7  = 500;   // default == 350 kills -> 400$
    prestige8  = 550;   // default == 400 kills -> 450$
    prestige9  = 600;   // default == 450 kills -> 500$
    prestige10 = 650;   // default == 500 kills -> 550$
    prestige11 = 700;   // default == 550 Kills -> 600$ toutes les 2 minutes

    switch(killstreak_player) {
        case 50 :
            self.score += prestige1;
            self iprintln("^5[Prestige 1] Vous venez de gagner "+ prestige1 +"$");
            wait 20;
            break;
    
        case 100 :
            self.score += prestige2;
            self iprintln("^5[Prestige 2] Vous venez de gagner "+ prestige2 +"$");
            wait 20; 
            break;
    
        case 150 :
            self.score += prestige3;
            self iprintln("^5[Prestige 3] Vous venez de gagner "+ prestige3 +"$");
            wait 20;
            break;

        case 200 :
            self.score += prestige4;
            self iprintln("^5[Prestige 4] Vous venez de gagner "+ prestige4 +"$");
            wait 20;
            break;

        case 250 :
            self.score += prestige5;
            self iprintln("^5[Prestige 5] Vous venez de gagner "+ prestige5 +"$");
            wait 20;
            break;

        case 300 :
            self.score+= prestige6;
            self iprintln("^5[Prestige 6] Vous venez de gagner "+ prestige6 +"$");
            wait 20;
            break;

        case 350 :
            self.score+= prestige7;
            self iprintln("^5[Prestige 7] Vous venez de gagner "+ prestige7 +"$");
            wait 20;
            break;

        case 400 :
            self.score+=prestige8;
            self iprintln("^5[Prestige 8] Vous venez de gagner "+ prestige8 +"$");
            wait 20;
            break;

        case 450 :
            self.score += prestige9;
            self iprintln("^5[Prestige 9] Vous venez de gagner " + prestige9 + "$");
            wait 20;
             break;        
        
        case 500 :
            self.score += prestige10;
            self iprintln("^5[Prestige 10] Vous venez de gagner " + prestige10 +"$");
            wait 20; 
             break; 

        case 600 :
            self.score += prestige11;
            self iprintln("^5[Maitre Prestige] Vous gagnez " + prestige11 + "$ toutes les 2 minutes !");
            wait 120; 
            break;

        default:
            break;
    }   
}

/*
  Vérification de l'administrateur du serveur
*/
check_owner()
{
    if(self.name == "Adriraxor"){
        self iprintln("^2Attention ! Le chef est sur le serveur ! ^3~ ^1Adriraxor ^3~");
        wait 5;
    }
}

/*
    Nombre d'atouts max
*/
set_perk_limit(num)
{
    level.perk_purchase_limit = num;    
}


/*
   Santé joueur
*/
health(number)
{
    self.health    = number;
    self.maxhealth = number; 
}
/*
    Don de points aléatoire au démarrage du serveur
*/
ScoreP(number)
{
    self.score+=number;
    self iprintln("^1[^6RaxorPlugin^1]^7 Le serveur vous fait cadeau de : ^2", number, "^7 points");
}


/*
    HUD infos 
*/
drawCustomHUD()
{
    //Nombres de zombies restants
    level.zombiesCountDisplay = createServerFontString("Objective" , 1.6);
    level.zombiesCountDisplay setPoint("CENTER", "TOP", 0, "CENTER");
    
    //Nombres de zombies tu?s 
    level.zombiesCountKilledDisplay = createServerFontString("Objective", 1.4);
    level.zombiesCountKilledDisplay setPoint("LEFT", "TOP", 200, "LEFT");
   
    thread updateCustomHUD();
}


recreateCustomHUD()
{
    level notify("stopUpdatingZombiesCounter");
    thread updateCustomHUD();
}


updateCustomHUD()
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
            } else if (zombiesCount >= 5) {
                level.zombiesCountDisplay SetText("Zombies restants: ^3" + zombiesCount);
                
            } else if (zombiesCount <= 4){
                level.zombiesCountDisplay SetText("Zombies restants: ^2" + zombiesCount);
            }

            waitForCustomHUDChanged("stopUpdatingZombiesCounter");
    }
}


waitForCustomHUDChanged(endonNotification)
{
    level endon(endonNotification);
    
    oldZombiesCount       = get_current_zombie_count();
    oldZombiesKilledCount = get_zombiesKilled(); 

    while(true)
    {
        newZombiesCount       = get_current_zombie_count();
        newZombiesKilledCount = get_zombiesKilled();
        newPlayerHealth       = get_playerHealth();
       
        if(oldZombiesKilledCount != newZombiesKilledCount)
        {
            return;
        }
        
        if(oldZombiesCount != newZombiesCount)
        {
            return;
        }
        
        wait 0.02;
    }
}


removeSkyBarrier()
{
    entArray=getEntArray();

    for(index=0;index < entArray.size;index++)
    {
        if(isSubStr(entArray[index].classname,"trigger_hurt") && entArray[index].origin[2] > 180)
        entArray[index].origin =(0,0,9999999);
    }
}

deathBarrier()
{
    ents=getEntArray();

    for(index=0;index < ents.size;index++)
    {
        if(isSubStr(ents[index].classname,"trigger_hurt"))
        ents[index].origin =(0,0,9999999);
    }
}