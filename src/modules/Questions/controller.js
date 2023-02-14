import model from './model.js'


const POST = async (req, res) => {
    try {
        const questions = await model.POST(req.body)
        
        if (questions) {
            return res.status(200).json({
                status: 200,
                message: 'success',
                data: questions
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
    POST
}