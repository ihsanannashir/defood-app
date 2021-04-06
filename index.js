const admin = require('firebase-admin');

var serviceAccount = require("./config.json");
var database = require("./resto.json");
var async = require ('async');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

var db = admin.firestore();

var allEntityNames = Object.keys(database);

var asyncTasks = [];

for (var i in allEntityNames) {
  var entityName = allEntityNames[i];
  var entity = database[entityName];
  var entityKeys = Object.keys(entity);

  console.log("began migrating "+ entityName);
  for (var j in entityKeys) {
    var entityKey = entityKeys[j];
    var dict = entity[entityKey];
    asyncTasks.push(function(callback){
      db.collection(entityName).doc(entityKey).set(dict)
        .then(function() {
          callback();
        })
        .catch(function(error) {
          console.log(error);
          callback();
        });
    });
  }
  async.parallel(asyncTasks, function(){
    console.log("Finished migrating "+ entityName);
  });
}