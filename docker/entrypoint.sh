#!/bin/bash

echo "Check current server version..."
echo "Server version: $(arkmanager version)"

if $UPDATE = true
then
    echo "Check for server updates..."
    #arkmanager update
fi

echo "Starting ark server..."

./ShooterGameServer TheIsland?listen?SessionName=$SESSIONNAME?ServerPassword=$SERVERPASSWORD?ServerAdminPassword=$SERVERADMINPASSWORD -server -log

echo "Ark server terminated."
