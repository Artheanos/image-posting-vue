const DotenvFlow = require('dotenv-flow-webpack');
const path = require('path');

module.exports = {
    plugins: [
        new DotenvFlow({
            node_env: process.env.NODE_ENV,
            path: path.resolve(__dirname, '..', '..', `./`),
            allowEmptyValues: true
        })
    ]
};
