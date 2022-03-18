const mongoose = require('mongoose');

const Schema = mongoose.Schema;
//User Schema
const userSchema = new Schema({
    // image : {
    //     type : String,
    //     required: false
    // },
    userName : {
        type : String,
        required: false
    },
    firstName:{
        type : String,
        required: false
    },
    lastName:{
        type : String,
        required: false
    },
    password:{
        type : String,
        required: false
    },
    userType:{
        type : String,
        required: false
    }

});

const Flowers = mongoose.model("Flowers",flowerSchema);

module.exports = Flowers;