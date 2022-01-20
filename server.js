const express = require("express");
const app = express();
const port = 3000;
const pool = require("./dbase");

app.use(express.json()) // => req.body

app.get("/", (req, res) =>{
    res.send("Hello Word!");
})

//get all car models
app.get("/car_models", async (req, res) =>{
    try{
        const allModels = await pool.query("select * from car_models");

        res.json(allModels.rows);
    }catch(error){
        console.log(error.message);
    }
})

//get a car model with id

app.get("/car_models/:id", async (req, res) =>{
    const {id} = req.params
    try{
        const getModel = await pool.query("select * from car_models where model_id = $1", [id]);

        res.json(getModel.rows[0]);
    }catch(error){
        console.log(error.message);
    }
})

//create a car model

app.post("/car_models", async (req, res)=>{
    try{
        const {model_name, model_id, model_year, brand_id} = req.body
        const newCar = await pool.query("insert into car_models values($1, $2, $3, $4)", [model_name, model_id, model_year, brand_id]);

        res.json(newCar.rows)
    }catch(error){
        console.log(error.message);
    }
});

app.listen(port, () => console.log(`app listening on port ${port}`));