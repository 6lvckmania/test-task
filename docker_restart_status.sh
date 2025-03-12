#!/bin/bash

# Function to restart the container
restart_container() {
  echo "Restarting container $CONTAINER_NAME..."
  
  # Check if the container is running
  if docker ps -q -f name=$CONTAINER_NAME; then
    docker restart $CONTAINER_NAME
    echo "Container $CONTAINER_NAME has been restarted."
  else
    echo "Container $CONTAINER_NAME not found or is not running."
  fi
}

# Function to check the status of the container
check_container_status() {
  echo "Checking the status of container $CONTAINER_NAME..."
  
  STATUS=$(docker inspect --format '{{.State.Status}}' $CONTAINER_NAME)

  if [ "$STATUS" == "running" ]; then
    echo "Container $CONTAINER_NAME is running."
  else
    echo "Container $CONTAINER_NAME is not running. Status: $STATUS."
  fi
}

# Request the container name
read -p "Enter the container name: " CONTAINER_NAME

# Main menu
echo "Choose an action:"
echo "1. Restart container $CONTAINER_NAME"
echo "2. Check the status of container $CONTAINER_NAME"
echo "3. Exit"

read -p "Choice (1-3): " choice

case $choice in
  1)
    restart_container
    ;;
  2)
    check_container_status
    ;;
  3)
    echo "Exiting..."
    exit 0
    ;;
  *)
    echo "Invalid choice!"
    ;;
esac
