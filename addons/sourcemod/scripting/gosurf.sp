/*
*	This plugin is an attempt (that will most likely fail due to my lack of time)
*	to re-implement a surf timer plugin with the most basic functions
*	but without all the bugs and mess that ckSurf comes with.
*/

/*
*	Steps i want to follow in the development
*	implement start and end zones so that they're visible and trigger-able
*	implement database structure for storing the zones coordinates
*	implement indipendent "timers" for each player that allow for calculation of the times 
*	implement database structure for storing players and times
*/

#pragma semicolon 1
#define PLUGIN_AUTHOR "Nikooo777"
#define PLUGIN_VERSION "0.01"

#include <sourcemod>
#include <sdktools>
#include <cstrike>

#include "gosurf_zones.sp"
#include "gosurf_misc.sp"


public Plugin myinfo = 
{
	name = "GoSurf",
	author = PLUGIN_AUTHOR,
	description = "A CS:GO surf timer",
	version = PLUGIN_VERSION,
	url = "https://go-free.info"
};

public void OnPluginStart()
{
	RegConsoleCmd("sm_create_start_zone", CommandCreateStartZone, "triggers start zone creation.");
}
