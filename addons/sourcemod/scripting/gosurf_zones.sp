float firstCorner[3];
public Action CommandCreateStartZone (int client, int args)
{
	PrintToConsole(client, "starting start-zone creation");
	Menu selectCornerMenu = new Menu(MenuHandlerCornerSelect);
	selectCornerMenu.SetTitle("Press 1 to select a corner");
	selectCornerMenu.AddItem("","select aimed corner");
	selectCornerMenu.Display(client, MENU_TIME_FOREVER);	
	

	return Plugin_Handled;
}

public int MenuHandlerCornerSelect(Handle menu, MenuAction action, int client, int item)
{
	if (action == MenuAction_Select && item == 0)
	{
		PrintToConsole(client, "Selecting corner...");
		
		if (!GetAimOrigin(client, firstCorner))
		{
			ReplyToCommand(client, "Failed getting aim position. You must be looking at a corner destination.");
		}
		ReplyToCommand(client, "Coordinates of the first corner: %.2f %.2f %.2f", firstCorner[0], firstCorner[1], firstCorner[2]);
	}
	else if (action == MenuAction_Cancel)
	{
		PrintToConsole(client, "Selection cancelled.");
	}
	else if(action == MenuAction_End)
	{
		delete menu;
	}
}