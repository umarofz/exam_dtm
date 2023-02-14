import model from './model.js'

const GET = async (req, res) => {
    try {
        const fanlar = await model.GET()

        if (fanlar) {
            return res.status(200).json({
                status: 200,
                message: 'fanlar',
                data: fanlar 
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

const POST = async (req, res) => {
    try {
        const body = await model.POST(req.body)

        if(body) return res.status(200).json({data: body})
    } catch (error) {
        return res.status(400).json({
            status: 400,
            message: error.message
        })
    }
}

export default {
    GET,
    POST
}