const fs = require('fs');

let apps = [
    {
        script: 'pm2.example.js',
        cwd: '/home/node/',
        env: {
            PORT: 3900
        }
    }
];

fs.readdirSync(__dirname + '/conf.d').forEach((file) => {
    if (file.match(/^.+\.config\.js$/)) {
        apps.push(require(__dirname + '/conf.d/' + file));
    }
});

module.exports = {apps};
