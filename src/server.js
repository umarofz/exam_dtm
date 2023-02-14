import express from 'express'
import router from './modules/index.js'

const app = express();

app.use(express.json())
app.use(router)
app.set('view engine', 'ejs')
app.get('/' , (req, res) => {
    res.render('home')
})

app.listen(5000, () => console.log('ready at *5000'))