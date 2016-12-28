var dash_button = require('node-dash-button');
var dash = dash_button(["ac:63:be:19:ed:c4"]); //address from step above
dash.on("detected", function (dash_id){
    if (dash_id === "ac:63:be:19:ed:c4"){
        console.log("omg found");
    }
});
var apn = require('apn');
var dateformat = require('dateformat');
var options = {
       cert : "conf/cert.pem",
       key : "conf/key.pem",
       passphrase: 'jaiguruki',
       production: false
};
var apnProvider = new apn.Provider(options);
var deviceToken = 'b8e51647e7b8caf6d6b3b150dcd2e8d1be1f90d12c7e16305fe32bb991199798'; 
var dash = dash_button(["ac:63:be:19:ed:c4"]); //address from step above
dash.on("detected", function (dash_id){
    
    if (dash_id === "ac:63:be:19:ed:c4"){
        console.log("omg found");

        var note = new apn.Notification();
        var now = new Date();
        note.expiry = Math.floor(Date.now() / 1000) + 3600; // Expires 1 hour from now.
        note.badge = 1;
        note.sound = "ping.aiff";
        note.alert = "New Data Point Recorded -"+ dateformat(now,"mediumDate");
        //note.alert = "New Data Point Recorded";
        note.payload = {'menstrualDate': 'date'};
        //note.payload = {'menstrualDate': "date"};
        note.topic = "com.stevens.MenstrualBuddy"; 
        console.log("omg found1");


        apnProvider.send(note, deviceToken).then( (result) => {
        // see documentation for an explanation of result 
        console.log(result);

        });
      }
    });
