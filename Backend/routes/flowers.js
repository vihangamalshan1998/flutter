const router = require("express").Router();
let Flower= require("../models/Flowers");
// const path = require('path');
// const multer = require('multer');
// const fs = require('fs');

//add a new Flower
router.route("/addFlower").post((req, res) => {
    const flowerName = req.body.flowerName;
    const commonNames = req.body.commonNames;
    const description = req.body.description;

    const newFlower = new Flower({
        flowerName,
        commonNames,
        description
    })
    newFlower.save().then(() =>{
        res.json("Flower Added Successfully")
    }).catch((err)=>{
        console.log(err);
    })
})

//get all Flowers
router.route("/allFlowers").get((req,res)=>{
    Flower.find().then((flowers =>{
        res.json(flowers)
    })).catch((err)=>{
        console.log(err)
    })
})

//update flower
router.route("/update/:id").put(async (req, res)=>{
    let flowerId = req.params.id;
    const {flowerName, commonNames, description} = req.body;

    const updateFlower = {
        flowerName,
        commonNames,
        description
    }
    const update = await Flower.findByIdAndUpdate(flowerId, updateFlower).then(()=> {
        res.status(200).send({status: "FLower updated"})
    }).catch((err)=>{
        console.log(err);
        res.status(500).send({status: "Error with updating data"});

    })

})

//delete Flower
router.route("/delete/:id").delete(async (req, res)=>{
    let flowerId= req.params.id;
    await Flower.findByIdAndDelete(flowerId).then(()=>{
        res.status(200).send({status: "Flower Deleted Successfully"});
    }).catch((err)=>{
        console.log(err.message);
        res.status(500).send({status: "Error with delete ", flowererror: err.message});
    })
})


module.exports = router;