require("./config/passport/google_passport")
require("./config/passport/google_passport")
const express = require('express')
const webOauth = require('./routes/webauth')
const mobileauth = require('./routes/mobileauth')


const app = express()
app.use(express.json());

app.use(`/api/${process.env.VERSION}/oauth/web`, webOauth)
app.use(`/api/${process.env.VERSION}/auth/mobile`, mobileauth)

module.exports = app