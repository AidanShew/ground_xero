show_debug_message("Scrolling Text Created");
x_speed=5;

messages=ds_list_create();
message1="Welcome to the Far From Eden: Ground Xero Dev Build!";
message2="Visit 'github.com/aidanshew/ground_xero' for more information about the project.";
message3=choose("NOT MADE BY AI!", "Made in a cave!", "Out of coffee...");

ds_list_add(messages, message1);
ds_list_add(messages, message2);
ds_list_add(messages, message3);

current_message=0;
selected_message = messages[| current_message];
x=room_width+50;
y=100;