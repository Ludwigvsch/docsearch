#!/bin/bash

# Check if the correct number of arguments were provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 port_number directory_path"
    exit 1
fi

# Assign arguments to variables for better readability
PORT_NUMBER=$1
DIRECTORY_PATH=$2

# Compile the Java code with the classpath including the necessary JARs
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful. Starting the server..."
    # Run the Java server with the classpath and arguments
    java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar DocSearchServer "$PORT_NUMBER" "$DIRECTORY_PATH"
else
    echo "Compilation failed."
fi