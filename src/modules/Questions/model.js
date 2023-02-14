import {fetchAll} from '../../utils/db.js'


const POST = async ({fanId}) => {
    return await fetchAll(`
        select * from questions where fan_id = $1
    `, [fanId])
}

export default {
    POST
}