function orderFood(food,price){

let email = localStorage.getItem("userEmail");

fetch("http://localhost:3000/order",{

method:"POST",
headers:{
"Content-Type":"application/json"
},

body:JSON.stringify({
email:email,
food:food,
price:price
})

})
.then(res=>res.json())
.then(data=>{
alert("Order placed successfully 🍕");
});

}
app.post("/feedback",(req,res)=>{

const {name,email,rating,message}=req.body;

console.log("Feedback:",name,email,rating,message);

res.json({
status:"success"
});

});
app.get("/admin/menu",(req,res)=>{
  db.query("SELECT * FROM menu",(err,result)=>{
    res.json(result);
  });
});