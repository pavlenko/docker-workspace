module.exports = {
    apps: [
        {
            script: 'pm2.example.js',
            cwd: '/home/node/',
            env: {
                PORT: 3900
            }
        }
    ],
    deploy: {}
};
