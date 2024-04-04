const http = require("http");

const HOST = process.env.HOST || '0.0.0.0';
const PORT = process.env.PORT || 3000;

http
    .createServer((req, res) => {
        res.writeHead(200);
        res.end("My first server!");
    })
    .listen(PORT, HOST, () => {
        console.log(`Server is running on http://${HOST}:${PORT}`);
    });