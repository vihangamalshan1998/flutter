const mongoose = require('mongoose');

const Schema = mongoose.Schema;
//Flower Schema
const flowerSchema = new Schema({
    // image : {
    //     type : String,
    //     required: false
    // },
    flowerName : {
        type : String,
        required: false
    },
    commonNames : {
        type : String,
        required: false
    },
    description : {
        type : String,
        required: false
    }
})

const Flowers = mongoose.model("Flowers",flowerSchema);

module.exports = Flowers;