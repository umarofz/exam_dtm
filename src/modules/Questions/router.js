import { Router } from "express";
import controller from './controller.js'

const router = Router();

router.get('/testing', (req, res) => {
    res.render('testing')
})
router.post('/testing', controller.POST)

export default router