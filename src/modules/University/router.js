import { Router } from "express";
import controller from './controller.js'

const router = Router();

router.get('/university', (req, res) => {
    res.render('university')
})
router.post('/university', controller.POST)

export default router