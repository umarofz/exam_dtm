import { Router } from "express";
import controller from './controller.js'

const router = Router();


router.post('/register', controller.REGISTER)
router.post('/login', controller.LOGIN)

router.get('/login', (req, res) => {
    res.render('login')
})
router.get('/register', (req, res) => {
    res.render('index')
})


export default router