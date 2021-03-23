const express =     require('express')
const fs =          require('fs')
const https =       require('https')
const cors =        require('cors')
const bodyParser =  require('body-parser')
const helmet =      require('helmet')
const path =        require('path')
const app =         express();

const port = process.env.PORT || 5000;
const credentials = {
    key: fs.readFileSync('/etc/letsencrypt/live/nickrheaume.ca/privkey.pem'),
    cert: fs.readFileSync('/etc/letsencrypt/live/nickrheaume.ca/fullchain.pem'),
    dhparam: fs.readFileSync('/etc/letsencrypt/ssl-dhparams.pem'),
}

// Middleware
app.use(cors())
app.use(bodyParser.urlencoded({ extended: false}))
app.use(bodyParser.json())
app.use(helmet())
app.use(express.static(__dirname + '/public'))
app.use(express.static(__dirname + '/views'))

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname + '/views/portfolio.html'))
})

https.createServer( credentials, app).listen(port, () => {
    console.log(`Portfolio client running on port ${port}`)
})