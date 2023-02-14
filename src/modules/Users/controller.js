import model from './model.js'
import jwt from '../../utils/jwt.js'

const REGISTER = async (req, res) => {
    try {
        console.log(req.body);
        const user = await model.REGISTER(req.body)
        console.log(user);

        if (user) {
            return res.status(201).json({
                status: 201,
                message: 'User successfully registered',
                token: jwt.sign({userId: user.user_id}),
                data: user
            })
        } else {
            return res.status(400).json({
                status: 400,
                message: 'smth went wrong'
            })
        }
    } catch (error) {
        return res.status(400).json({
            status: 400,
            message: error.message
        })
    }
}

const LOGIN = async (req, res) => {
    try {
        const user = await model.LOGIN(req.body)


        if (user) {
            return res.status(200).json({
                status:200,
                message: 'success',
                token: jwt.sign({userId: user.user_id}),
                data: user
            })
        } else {
            return res.status(400).json({
                status: 400,
                message: 'smth went wrong'
            })
        }
    } catch (error) {
        return res.status(400).json({
            status: 400,
            message: error.message
        })
    }
}

export default {
    REGISTER,
    LOGIN
}