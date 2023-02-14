import { Router } from "express";
import controller from "./controller.js";

const router = Router()

router.get('/fan', controller.GET)
router.post('/fan', controller.POST)

export default router;