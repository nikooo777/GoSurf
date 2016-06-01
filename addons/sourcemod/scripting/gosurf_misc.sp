stock GetAimOrigin(int client, float hOrigin[3]) 
{
    float clientViewAngles[3]; //direction
    float clientOrigin[3];	//origin
    
    GetClientEyePosition(client,clientOrigin);
    GetClientEyeAngles(client, clientViewAngles);

	//cast a ray from the client position in direction of the client's eye angles until something is hit
    Handle trace = TR_TraceRayFilterEx(clientOrigin, clientViewAngles, MASK_SHOT, RayType_Infinite, TraceEntityFilterPlayer);

    if(TR_DidHit(trace)) 
    {
        TR_GetEndPosition(hOrigin, trace);
        CloseHandle(trace);
        return 1;
    }

    CloseHandle(trace);
    return 0;
}

public bool TraceEntityFilterPlayer(entity, contentsMask) 
{
    return entity > GetMaxClients(); //this allows for the ray to pass through players
}  