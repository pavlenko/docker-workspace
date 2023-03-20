const path = require("path");
const fs = require("fs");

const dir  = path.resolve(__dirname + '/../apps');
const apps = [];
fs.readdirSync(dir).forEach((file) => {
    if (null !== file.match(/^.+\.conf\.json$/)) {
        apps.push(require(dir + '/' + file))
    }
});

module.exports = {
    apps: apps
}