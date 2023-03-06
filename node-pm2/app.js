const express = require('express');
const app = express();
const PORT = process.env.PORT
app.get('/',(req,res) => {
    res.send("Hello World!\n");
})
app.listen(PORT,() => {
    console.log(`server is running on port ${PORT}`);
})